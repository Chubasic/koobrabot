# Koobrabot

Telegram bot with no functionality👌
[Add to telegram](https://t.me/koobrabot_bot)

## How to use?

- /start - Initilize bot
- /hello - Say hello to koobra 😁
- /kitty - Get a kitty 👍

## Kubernetes objects

| Name               | Prompt                                                                       | Description       | Example                                                                          |
| ------------------ | ---------------------------------------------------------------------------- | ----------------- | -------------------------------------------------------------------------------- |
| app                | Create kubernetes Pod component with container port in YAML                  | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app)                 |
| app-livenessProbe  | Create kubernetes Pod component with liveness probe in YAML                  | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-livenessProbe)   |
| app-readinessProbe | Create kubernetes component with readiness probe in YAML                     | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-readinessProbe)  |
| app-volumeMounts   | Generate kubernetes volume mounts component with health checks in YAML       | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-volumeMounts)    |
| app-cronjob        | Create kubernetes CronJob component in YAML                                  | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-cronjob)         |
| app-job            | Create kubernetes Job component with in YAML                                 | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-job)             |
| app-multicontainer | Create kubernetes multicontainer Pod component in YAML                       | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-multicontainer)  |
| app-resources      | Generate kubernetes Pod with configured recources, ports, and probes in YAML | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-resources)       |
| app-secret-env     | Generate kubernetes Pod with configured secret env in YAML                   | Creates component | [File](https://github.com/Chubasic/koobrabot/blob/main/yaml/app-secret-env.yaml) |
