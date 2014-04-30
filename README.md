fulcrum
=======

[Pivotal Tracker](http://www.pivotaltracker.com/) status at a glance. Designed for phones, TVs, and low-bandwidth video conferences.


Getting Started
---------------

Install node modules:

```bash
npm install
```

Build client-side assets:
```bash
make build
```

Integrating with Pivotal Tracker
--------------------------------

1. Create `server/config.json` with values for…

* `apiToken`: Your Pivotal Tracker API token, available on [your profile](https://www.pivotaltracker.com/profile)
* `projectId`: The ID of the project you want to load data for, visible in the URL

2. Start up the development server:

```bash
make dev-server
```
