# etl/utils.py
import re

def load_codes(md_file: str) -> dict:
    """
    Lê o arquivo dd_codes.md e cria dicionários de mapeamento
    para as colunas categóricas.
    """
    codes = {}
    current_section = None

    with open(md_file, "r", encoding="utf-8") as f:
        for line in f:
            # detecta seção (ex: "Accident Severity")
            match_section = re.match(r"# (.+)", line)
            if match_section:
                current_section = match_section.group(1).strip().lower().replace(" ", "_")
                codes[current_section] = {}
                continue

            # detecta linhas de tabela "| code | label |"
            parts = [p.strip() for p in line.split("|") if p.strip()]
            if len(parts) == 2 and parts[0].isdigit():
                code, label = parts
                codes[current_section][int(code)] = label

    return codes
