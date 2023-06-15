import os
import subprocess
import json
import ast

for root, dirs, files in os.walk('.'):
    for f in files:
        if f.endswith(".ldb"):
            path = os.path.join(root, f)
            process = subprocess.Popen(
                ["ldbdump", path], stdout=subprocess.PIPE, shell=True)
            (output, err) = process.communicate()
            exit_code = process.wait()
            for line in (output.split("\n")[1:]):
                if line.strip() == "":
                    continue
                parsed = ast.literal_eval("{" + line + "}")
                key = parsed.keys()[0]
                print(json.dumps(
                    {"key": key.encode('string-escape'), "value": parsed[key]}))
