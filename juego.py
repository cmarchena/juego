estudiantes = {
    1: [
        "Midhun",
        "Arianne",
        "https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg",
        False
    ],
    2: [
        "Samir",
        "Eduardo",
        "https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg",
        False
    ],
    3: [
        "Yoiber",
        "Yofran",
        "https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg",
        False
    ],
    4: [
        "Sandra",
        "Tania",
        "https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg",
        False
    ],
    5: [
        "Luis",
        "Jhon Jairo",
        "https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg",
        False
    ],
    6: [
        "Yonathan",
        "Alan",
        "https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg",
        False
    ],
    7: [
        "Israel",
        "Fabián",
        "https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg",
        False
    ],
    8: [
        "Jose",
        "Cecilia",
        "https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg",
        False
    ],
    9: [
        "Jairo",
        "Berenice",
        "https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg",
        False
    ],
    10: [
        "Camila",
        "Paolo",
        "https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg",
        False
    ],
    11: [
        "Albert",
        "Sharik",
        "https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg",
        False
    ],
    12: [
        "Félix",
        "Carlos",
        "https://i.pinimg.com/736x/1b/58/f4/1b58f41e4f7668edb26420f8cadab895.jpg",
        False
    ],
}



def game():
    aciertos = 0
    errores = 0
    intentos = 12
    estado = True
    print(
         f"""¡Hola Miguel! Bienvenido a Meme Driven Development!
Queremos retarte a recordar el nombre de todas las personas
que hemos sido estudiantes de AWS re/Start Madrid y cómo nos hemos sentado
la mayor parte del curso😉.
Tienes {intentos} intentos😎
"""
    )
    while estado:
        nombre_estudiante = input(f"Dime un nombre o 'f' para rendirte😃: ")

        if nombre_estudiante == "f":
            print("¡Te has rendido!😂")
            estado = False
            break

        encontrado = False
        for clave, par in estudiantes.items():
            if nombre_estudiante in par:
                encontrado = True
                otro_estudiante = par[0] if par[1] == nombre_estudiante else par[1]
                acierto = input(f"¿Quién se sienta con {nombre_estudiante}? ")
                if acierto == otro_estudiante:
                    print(
                        f"¡Correcto! {par[0]} y {par[1]} quieren compartir contigo esto: {par[2]}",
                    )
                    estudiantes[clave][3] = True
                    aciertos += 1
                else:
                    print(f"¡Muy mal!😄. La otra persona es {otro_estudiante}.")
                    errores += 1
                break

        if not encontrado:
            print(f"No, esa persona no es estudiante😎.")
            errores += 1

        intentos -= 1
        if intentos > 0:
            print(f"Te quedan {intentos} intento(s)")
            print(f"Aciertos: {aciertos}")
            print(f"errores: {errores}")
        else:
            estado = False
    print("-----------")
    print("Resultado final:")
    print("-----------")
    print(f"Aciertos: {aciertos}")
    print(f"errores: {errores}")
    porcentaje = (aciertos/12)*100
    print(f"Porcentaje de aciertos: {porcentaje}%")
    elementos_con_valor_false = [par for par in estudiantes.values() if not par[3]]
    if elementos_con_valor_false:
        print("Te faltaron: ")
        for par in elementos_con_valor_false:
            print(f"{par[0]} y {par[1]}: {par[2]}")

    
    if porcentaje < 70:
        print("hmmm necesita mejorar😅... No has aprobado el test, ¡sigue intentando!")
    else:
        print("¡Has aprobado!")
    print(
        "¡Esperamos que lo hayas disfrutado, muchas gracias por ser nuestro profesor!")


game()
