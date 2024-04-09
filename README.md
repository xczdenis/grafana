## Запустить
Сначала нужно создать файл `.env`:
```bash
make env
```

На Windows:
```bash
copy .env.template .env
```

Запустить в докере grafana, influxdb и telegraf:
```bash
make influx
```

Запустить в докере influxdb и telegraf:
```bash
make influx
```

Остановить:
```bash
make down
```

Посмотреть логи:
```bash
make logs
```

Зайти в контейнер:
```bash
make bash
or
make sh
```
