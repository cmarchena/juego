#!/bin/bash

# Define the estudiantes associative array
declare -A estudiantes

# Populate the estudiantes array
estudiantes[1]="Midhun Arianne https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg False"
estudiantes[2]="Samir Eduardo https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg False"
estudiantes[3]="Yoiber Yofran https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg False"
estudiantes[4]="Sandra Tania https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg False"
estudiantes[5]="Luis John https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg False"
estudiantes[6]="Yonathan Alan https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg False"
estudiantes[7]="Israel Fabián https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg False"
estudiantes[8]="Jose Cecilia https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg False"
estudiantes[9]="Jairo Berenice https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg False"
estudiantes[10]="Camila Paolo https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg False"
estudiantes[11]="Albert Sharik https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg False"
estudiantes[12]="Félix Carlos https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg False"

# Rest of the script
aciertos=0
errores=0
intentos=12
estado=true

echo "¡Hola Miguel! Bienvenido a Meme Driven Development!"
echo "Queremos retarte a recordar el nombre de todas las personas"
echo "que hemos sido estudiantes de AWS re/Start Madrid y cómo nos hemos sentado"
echo "la mayor parte del curso😉."
echo "Tienes $intentos intentos😎"

while $estado; do
    read -p "Dime un nombre o 'f' para rendirte😃: " nombre_estudiante

    if [ "$nombre_estudiante" = "f" ]; then
        echo "¡Te has rendido!😂"
        estado=false
        break
    fi

    encontrado=false
    for clave in "${!estudiantes[@]}"; do
    par=(${estudiantes[$clave]})
    if [[ "${par[0]}" = "$nombre_estudiante" || "${par[1]}" = "$nombre_estudiante" ]]; then
        encontrado=true
        if [ "${par[1]}" = "$nombre_estudiante" ]; then
            otro_estudiante="${par[0]}"
        else
            otro_estudiante="${par[1]}"
        fi
        read -p "¿Quién se sienta con $nombre_estudiante? " acierto
        if [ "$acierto" = "$otro_estudiante" ]; then
            echo "¡Correcto! ${par[0]} y ${par[1]} quieren compartir contigo esto: ${par[2]}"
            estudiantes[$clave]="${par[0]} ${par[1]} ${par[2]} True"
            aciertos=$((aciertos+1))
        else
            echo "¡Muy mal!😄. La otra persona es $otro_estudiante."
            errores=$((errores+1))
        fi
        break
    fi
done

    if ! $encontrado; then
        echo "No, esa persona no es estudiante😎."
        errores=$((errores+1))
    fi

    intentos=$((intentos-1))
    if [ $intentos -gt 0 ]; then
        echo "Te quedan $intentos intento(s)"
        echo "Aciertos: $aciertos"
        echo "Errores: $errores"
    else
        estado=false
    fi
done

echo "-----------"
echo "Resultado final:"
echo "-----------"
echo "Aciertos: $aciertos"
echo "Errores: $errores"
porcentaje=$((aciertos*100/12))
echo "Porcentaje de aciertos: $porcentaje%"
elementos_con_valor_false=()
for clave in "${!estudiantes[@]}"; do
    par=(${estudiantes[$clave]})
    if [ "${par[3]}" = "False" ]; then
        elementos_con_valor_false+=("${par[0]} y ${par[1]}: ${par[2]}")
    fi
done

if [ ${#elementos_con_valor_false[@]} -gt 0 ]; then
    echo "Te faltaron:"
    for elemento in "${elementos_con_valor_false[@]}"; do
        echo "$elemento"
    done
fi

if [ $porcentaje -lt 70 ]; then
    echo "hmmm necesita mejorar😅... No has aprobado el test, ¡sigue intentando!"
else
    echo "¡Has aprobado!"
fi

echo "¡Esperamos que lo hayas disfrutado, muchas gracias por ser nuestro profesor!"
