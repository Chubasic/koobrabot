# Koobrabot

Telegram bot with no functionality👌
[Add to telegram](https://t.me/koobrabot_bot)

## How to use?

- /start - Initilize bot
- /hello - Say hello to koobra 😁
- /kitty - Get a kitty 👍

## Kubernetes objects

| Name               | Prompt                                                                       | Description       | Example                                                                              |
| ------------------ | ---------------------------------------------------------------------------- | ----------------- | ------------------------------------------------------------------------------------ |
| app                | Create kubernetes Pod component with container port in YAML                  | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app.yaml)                |
| app-livenessProbe  | Create kubernetes Pod component with liveness probe in YAML                  | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-livenessProbe.yaml)  |
| app-readinessProbe | Create kubernetes component with readiness probe in YAML                     | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-readinessProbe.yaml) |
| app-volumeMounts   | Generate kubernetes volume mounts component with health checks in YAML       | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-volumeMounts.yaml)   |
| app-cronjob        | Create kubernetes CronJob component in YAML                                  | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-cronjob.yaml)        |
| app-job            | Create kubernetes Job component with in YAML                                 | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-job.yaml)            |
| app-multicontainer | Create kubernetes multicontainer Pod component in YAML                       | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-multicontainer.yaml) |
| app-resources      | Generate kubernetes Pod with configured recources, ports, and probes in YAML | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-resources.yaml)      |
| app-secret-env     | Generate kubernetes Pod with configured secret env in YAML                   | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-secret-env.yaml)     |
