echo "Instalación Icecast2 con SSL"
while true
do
    clear
    echo "MENU SCRIPT V.1"
    echo "1. Instalar Icecast con Snapd y Certbot (FULL)"
    echo "2. Solo instalar Icecast2 con SSL ya Instalados."
    echo "Escoge opcion: "
    read opcion
    case $opcion in
        1)
            sudo apt update && sudo apt upgrade -y
            echo "Instalar SNAP"
            sudo apt install snapd
            clear
            echo "Instalacion Finalizada de Snapd"
            sleep 5
            echo "Ahora continuaremos con la instalacion de Certificados SSL"
            sleep 5
            sudo snap install --classic certbot
            certbot certonly --standalone
            echo "Ingresa el nombre de tu dominio para configurar tus SSL en Icecast2"
            read dominio
            sudo apt install icecast2 -y
            sudo systemctl enable icecast2.service
            sudo cat /dev/null > /etc/icecast2/icecast.xml
            sudo cat icecast.xml > /etc/icecast2/icecast.xml
            clear
            sudo cat /etc/letsencrypt/live/$dominio/fullchain.pem /etc/letsencrypt/live/$dominio/privkey.pem > /etc/icecast2/bundle.pem
            sudo systemctl restart icecast2.service
            break
            ;;

        2)

            echo "Ahora continuaremos con la instalacion de Certificados SSL"
            sleep 5
            sudo apt update && sudo apt upgrade -y
            echo "Ingresa el nombre de tu dominio para configurar tus SSL en Icecast2"
            read dominio
            sudo apt install icecast2 -y
            clear
            sudo systemctl enable icecast2.service
            sleep 5
            sudo cat /dev/null > /etc/icecast2/icecast.xml
            sudo cat icecast.xml > /etc/icecast2/icecast.xml
            echo "Ahora tienes que cambiar las contraseñas del XML"
            sleep 5
            sudo nano /etc/icecast2/icecast.xml
            clear
            sudo cat /etc/letsencrypt/live/$dominio/fullchain.pem /etc/letsencrypt/live/$dominio/privkey.pem > /etc/icecast2/bundle.pem
            sudo systemctl restart icecast2.service
            break
            ;;

        *)
            echo "Opción inválida, intenta de nuevo."
            
            ;;
       esac
    break
done

clear
echo "LA INSTALACIÓN A FINALIZADO ! "



