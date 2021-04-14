server {
    listen {{ .interface }}:8099 default_server;

    include /etc/nginx/includes/server_params.conf;
    include /etc/nginx/includes/proxy_params.conf;

    allow   172.30.32.2;
    deny    all;

    location = /api {
        proxy_pass              http://supervisor/core/websocket;

        proxy_http_version      1.1;
        proxy_set_header        Upgrade $http_upgrade;
        proxy_set_header        Connection $connection_upgrade;
        proxy_set_header        X-Supervisor-Token "{{ env "SUPERVISOR_TOKEN" }}";
    }

    location / {
        root /var/www/tileboard/;

        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;

        sub_filter_once off;
        sub_filter 'AUTH_TOKEN_OVERRIDE = null' 'AUTH_TOKEN_OVERRIDE = "{{ env "SUPERVISOR_TOKEN" }}"';
        sub_filter 'SERVER_URL_OVERRIDE = null' 'SERVER_URL_OVERRIDE = location.protocol + "//" + location.host';
        sub_filter 'WS_URL_OVERRIDE = null' 'WS_URL_OVERRIDE = location.protocol.replace("http", "ws") + "//" + location.host + "{{ .ingress_path }}api"';
    }
}
