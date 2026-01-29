# Docker Cheatsheet

## Ciclo de vida
| Comando | Acción |
| :--- | :--- |
| **docker-compose up -d** | Levanta todo el laboratorio en segundo plano. |
| **docker-compose stop** | Pausa los contenedores (no borra nada, ahorra RAM). |
| **docker-compose start** | Reanuda los contenedores pausados. |
| **docker-compose down** | Apaga y elimina contenedores y redes (limpieza total). |
| **docker-compose restart** | Reinicia los servicios (útil si algo se queda trabado). |

## Inspección y diagnóstico
| Comando | Acción |
| :--- | :--- |
| **docker ps** | Lista los contenedores activos. Si no ves ai_web, algo falló. |
| **docker ps -a** | Lista todos, incluso los que se cerraron por error. |
| **docker-compose logs** | Muestra los logs de los contenedores. |
| **docker-compose logs -f** | Ver en tiempo real qué está pasando (streaming de errores). |
| **docker-compose logs [servicio]** | Ver logs específicos (ej. docker-compose logs ai_web_lab). |
| **docker-compose top** | Muestra los procesos en ejecución en los contenedores. |
| **docker-compose stats** | Muestra estadísticas de uso de recursos. |
| **docker stats --no-stream** | Esto dirá cuánta memoria y CPU está consumiendo tu laboratorio en tiempo real |

## Ejecución y Entorno
| Comando | Acción |
| :--- | :--- |
| **docker exec -it [nombre] bash** | Entra a la "máquina" para ejecutar comandos manuales. |
| **docker-compose build --no-cache** | Reconstruye todo desde cero (hazlo si cambias el Dockerfile). |
| **docker cp [archivo] [contenedor]:/ruta** | Mueve archivos de tu PC al contenedor (y viceversa). |

## Limpieza
| Comando | Acción |
| :--- | :--- |
| **docker system prune** | Elimina contenedores, imágenes, volúmenes y redes no utilizados. |
| **docker image prune -a** | Borra imágenes viejas para recuperar espacio en disco. |
| **docker volume rm $(docker volume ls -qf dangling=true)** | Limpia volúmenes basura |