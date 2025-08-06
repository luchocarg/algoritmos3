#test
import os
import subprocess

BASE_DIR = "docs/guias"

'''
#!/bin/bash
if [ -z "$1" ]; then
    echo "Error: No es .typ"
    echo "Uso: typst-to-html <archivo.typ>"
    exit 1
fi
pandoc --mathjax -s -f typst -t html -o "${1%.*}.html" "$1"
'''
TYPST_CMD = "typst-to-html"
def convertir_typ_a_html(archivo_typ, carpeta_destino):
    try:
        comando = [TYPST_CMD, archivo_typ, f"{carpeta_destino}/{archivo_typ.replace('.typ', '.html')}"]
        subprocess.run(comando, check=True)
        print(f"Convertido: {archivo_typ} → {carpeta_destino}/{archivo_typ.replace('.typ', '.html')}")
    except subprocess.CalledProcessError as e:
        print(f"Error al convertir {archivo_typ}: {e}")

def convertir_todos_los_typ():
    for guia in os.listdir(BASE_DIR):
        guia_path = os.path.join(BASE_DIR, guia)
        
        if os.path.isdir(guia_path):
            print(f"Procesando guía: {guia}")
            
            for subcarpeta in os.listdir(guia_path):
                subcarpeta_path = os.path.join(guia_path, subcarpeta)

                if os.path.isdir(subcarpeta_path):
                    print(f"  Procesando subcarpeta: {subcarpeta}")
                    
                    for archivo in os.listdir(subcarpeta_path):
                        archivo_path = os.path.join(subcarpeta_path, archivo)
                        
                        if archivo.endswith('.typ'):
                            convertir_typ_a_html(archivo_path, subcarpeta_path)

if __name__ == "__main__":
    convertir_todos_los_typ()
