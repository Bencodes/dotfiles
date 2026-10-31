import io
import json
from pathlib import Path
import runpy
from unittest.mock import MagicMock, patch


def run(responses):
    server = MagicMock()
    server.__enter__.return_value = server
    server.stdin = io.StringIO()
    server.stdout = io.StringIO("\n".join(json.dumps(r) for r in responses))
    with patch("subprocess.Popen", return_value=server):
        try:
            runpy.run_path(str(Path(__file__).with_name("disable-telemetry.py")))
        finally:
            server.terminate.assert_called_once()
    return [json.loads(line) for line in server.stdin.getvalue().splitlines()]


requests = run([{"id": 1, "result": {}}, {"method": "notification"}, {"id": 2, "result": {}}])
assert requests[1] == {"method": "initialized"}
assert requests[2]["method"] == "config/value/write"
assert requests[2]["params"] == {
    "keyPath": "analytics.enabled", "value": False, "mergeStrategy": "replace"
}

for responses in [[], [{"id": 1, "result": {}}, {"id": 2, "error": "write failed"}]]:
    try:
        run(responses)
    except RuntimeError:
        pass
    else:
        raise AssertionError("Server failures must not be reported as successful updates")
