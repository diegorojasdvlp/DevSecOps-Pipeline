# DevSecOps HUB

## Comandos Importantes

### Entrar a contendores
docker exec -it jenkins /bin/bash
cat var/jenkins_home/secrets/initialAdminPassword


## Como instalar el pipeline

- cd ./pipeline
- docker compose up -d
- (asegurarse que se levanten todos los contenedores: jenkins, sonar db, sonarqube y zaproxy/owasp)

Jenkins

- docker exec -it jenkins /bin/bash
- cat var/jenkins_home/secrets/initialAdminPassword
- (copiar clave)
- (salir del contenedor)
- acceder usando http://localhost:8080
- (pegar clave)
- (instalar puglins sugeridos)
![alt text](<Captura desde 2026-01-02 10-32-48.png>)
- (crear credenciales para usuario adminsitrador)
![alt text](<Captura desde 2026-01-02 10-39-23.png>)
- (dejar configuracion host predeterminado)

Configurar Maven tool

- Ir a Managed Settings (Properties) > Tools
- Buscar Maven install (Instalaciones de Maven)
- Agregar un nuevo maven con nombre "maven-local"
![alt text](<Captura desde 2026-01-02 10-47-21.png>)
- Aplicar cambios

Configurar Sonarqube tool

- Ir a Managed Settings (Properties) > Plugins > Available plugins
- Buscar los plugins "SonarQube Scanner" y "Sonar Quality Gates"
![alt text](<Captura desde 2026-01-02 10-50-55.png>)
- Instalar los plugins
![alt text](<Captura desde 2026-01-02 10-52-59.png>)
![alt text](<Captura desde 2026-01-02 10-52-12.png>)
- Reiniciar Jenkins
![alt text](<Captura desde 2026-01-02 10-53-39.png>)

- Ir a Managed Settings (Properties) > Tools
- Buscar SonarQube Scanner install (Instalaciones de SonarQube Scanner)
- Agregar un nuevo scanner con nombre "sonar-scanner"
![alt text](<Captura desde 2026-01-02 10-57-03.png>)

- Ir a Managed Settings (Properties) > Credentials
- Crear una nueva credencial en System de tipo Global Credentials (unrestricted) con los siguiente parametros:
    Kind: Secret text
    Scope: Global
    Secret: "token sonarqube configurado"
    ID: "nombre token sonarqube configurado"
- Crear token
![alt text](<Captura desde 2026-01-02 11-24-49.png>)

- Ir a Managed Settings (Properties) > System
- Buscar SonarQube servers > Instalaciones SonarQube
- Agregar un nuevo servidor con lol siguiente
    Name: sonar-local
    URL: http://sonarqube:9000
    Server Auth: jenkins-pipeline
- Aplicar cambios

Configurar Tarea (Job)
- Ir a Home > Nueva Tarea
- Crear una tarea de tipo "pipeline"
![alt text](<Captura desde 2026-01-02 11-30-52.png>)
- Copiar contenido de jenkins/jenkinsfile en Pipeline > Definition (Pipeline Script)
![alt text](<Captura desde 2026-01-02 11-38-21.png>)
- Aplicar cambios
- Para testear: ejecutar el job con boton build now (Construir Ahora)
![alt text](<Captura desde 2026-01-02 11-39-38.png>)


Configurar Sonarqube Quality Gate
<Pendiente>

Configurar Owasp Zap tool
<Pendiente>

SonarQube

- Acceder a URL http://localhost:9000
- Credenciales provisorias admin / admin
- Cambiar credenciales
- Ir a profile > My Account > Security
- Generar nuevo token "jenkins-pipeline"
![alt text](<Captura desde 2026-01-02 11-20-46.png>)
- Copiar token, y respaldar hasta configurar jenkins

Zaproxy (OWASP ZAP)


## Estructura de contenedores
