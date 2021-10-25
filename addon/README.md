# TileBoard

A simple yet highly customizable dashboard for Home Assistant. The main goal of this project was to create a simple dashboard with an easy way to edit and add functionality with minimum knowledge of javascript and html.

Should you have any ideas or questions please post them on the home-assistant forum or create an issue on Github.

## Installation

1. Go to `Supervisor`, then click `Add-on Store`.
2. Click the "three dots" in the top-right corner and select `Repositories`.
3. Enter `https://github.com/resoai/TileBoard-addon` in the input field and click `Add`.
4. The `Tileboard` addon should appear in the list. Click it and then click `Install`.

## Configuration

Configure the `configFolder` in the configuration tab (defaults to `tileboard`). This should be a folder inside of `config/`. Add your configuration files in the configured folder.

If you want to expose TileBoard on its own port rather than only using it through the "ingress" panel, you can define the external port in the settings, choose whether to use HTTPS or not and whether to use an external or internal URL (if using external, it will still fall back to an internal URL if external is not set in "General" HA settings).

Note: You can use the Home Assistant add-ons like `File editor` or `Visual Studio Code` to manage your configuration files.

Here are various configuration files that can be added to that folder:

| file | required | description |
| ----- | ------- | ----------- |
| `config.js` | yes | The main configuration file. You can use [config.example.js](https://github.com/resoai/TileBoard/blob/master/config.example.js) as a starting point. |
| `styles/custom.css` | no | The stylesheet with custom CSS overrides. |
| `images/*` | no | The extra images that can be referenced from the configuration file using relative paths. |
| `locales/*` | no | If you want to add support for more locales than the bundled ones, you can add more locale files here. The file needs to have format `[locale-code].js`. |

Note 1: Adding or removing files requires restart of the add-on. After doing that the changes to the files should get applied immediately.

Note 2: The `serverUrl` and `wsUrl` options in the `config.js` are overridden by the add-on and don't have to be configured.

## Links

* [Official Git Repository](https://github.com/resoai/TileBoard)
* [Discussion on Home Assistant Community](https://community.home-assistant.io/t/new-dashboard-for-ha/57173)
* [Demo Video](https://youtu.be/L8JwzWNAPr8)

## License

MIT License
