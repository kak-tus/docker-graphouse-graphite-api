max_stale = "2m"

consul {
  retry {
    attempts = 0
  }
}

vault {
  retry {
    attempts = 0
  }
}

template {
  source = "/root/templates/graphite-api.yaml.template"
  destination = "/etc/graphite-api.yaml"
}

exec {
  command = "gunicorn -b 0.0.0.0:8000 -w 2 --log-level debug graphite_api.app:app"
  splay = "60s"
}
