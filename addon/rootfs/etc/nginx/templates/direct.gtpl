server {
    {{ if not .ssl }}
    listen 80 default_server;
    {{ else }}
    listen 80 default_server ssl http2;
    {{ end }}

    include /etc/nginx/includes/server_params.conf;
    include /etc/nginx/includes/proxy_params.conf;

    {{ if .ssl }}
    include /etc/nginx/includes/ssl_params.conf;

    ssl_certificate /ssl/{{ .certfile }};
    ssl_certificate_key /ssl/{{ .keyfile }};
    {{ end }}

    location / {
        root /var/www/tileboard/;

        sub_filter_once off;
        sub_filter 'SERVER_URL_OVERRIDE = null' 'SERVER_URL_OVERRIDE = "{{ .base_url }}"';
        sub_filter 'WS_URL_OVERRIDE = null' 'WS_URL_OVERRIDE = "{{ .websocket_url }}/api"';
    }
}
