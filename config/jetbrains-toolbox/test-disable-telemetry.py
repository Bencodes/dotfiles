import json
from pathlib import Path
import subprocess
import sys
import tempfile


script = Path(__file__).with_name("disable-telemetry.py")
with tempfile.TemporaryDirectory() as directory:
    path = Path(directory) / "nested/settings.json"
    command = [sys.executable, str(script), str(path)]
    subprocess.run(command, check=True)
    assert json.loads(path.read_text()) == {"statistics": {"allow": False}}

    path.write_text('{"statistics":{"allow":true},"shell_scripts":{"location":"keep"}}')
    for _ in range(2):
        subprocess.run(command, check=True)
        assert json.loads(path.read_text()) == {
            "statistics": {"allow": False},
            "shell_scripts": {"location": "keep"},
        }

    path.write_text("invalid JSON")
    assert subprocess.run(command, capture_output=True).returncode != 0
    assert path.read_text() == "invalid JSON"
    assert list(path.parent.iterdir()) == [path]
