import json
import signal
import subprocess


def timed_out(_signum, _frame):
    raise TimeoutError("Timed out updating Codex telemetry settings")


signal.signal(signal.SIGALRM, timed_out)
signal.alarm(30)

# Use Codex's config writer to preserve unrelated TOML settings and comments.
with subprocess.Popen(
    ["codex", "-c", "analytics.enabled=false", "app-server", "--listen", "stdio://"],
    stdin=subprocess.PIPE,
    stdout=subprocess.PIPE,
    text=True,
) as server:
    try:
        requests = [
            {"id": 1, "method": "initialize", "params": {
                "clientInfo": {"name": "dotfiles", "version": "1.0"}
            }},
            {"id": 2, "method": "config/value/write", "params": {
                "keyPath": "analytics.enabled", "value": False, "mergeStrategy": "replace"
            }},
        ]
        for request in requests:
            server.stdin.write(json.dumps(request) + "\n")
            server.stdin.flush()
            for line in server.stdout:
                response = json.loads(line)
                if response.get("id") == request["id"]:
                    if "error" in response:
                        raise RuntimeError(response["error"])
                    break
            else:
                raise RuntimeError("Codex exited before confirming the settings update")
            if request["id"] == 1:
                server.stdin.write('{"method":"initialized"}\n')
                server.stdin.flush()
    finally:
        signal.alarm(0)
        server.terminate()
        try:
            server.wait(timeout=5)
        except subprocess.TimeoutExpired:
            server.kill()
