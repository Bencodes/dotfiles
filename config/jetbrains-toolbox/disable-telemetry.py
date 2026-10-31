import json
from pathlib import Path
import sys
import tempfile


path = Path(sys.argv[1]).expanduser().resolve()
settings = json.loads(path.read_text()) if path.exists() else {}
settings.setdefault("statistics", {})["allow"] = False
path.parent.mkdir(parents=True, exist_ok=True)

# Replace only after valid JSON has been written, preserving the original on error.
with tempfile.NamedTemporaryFile(mode="w", dir=path.parent, delete=False) as output:
    temporary = Path(output.name)
    try:
        json.dump(settings, output, indent=2)
        output.write("\n")
        output.flush()
        temporary.replace(path)
    finally:
        temporary.unlink(missing_ok=True)
