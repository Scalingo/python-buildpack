# Buildpack: Python

This is the official [Scalingo buildpack](https://doc.scalingo.com/buildpacks) for Python apps, powered by [Pipenv](https://docs.pipenv.org/), [pip](https://pip.pypa.io/) and other excellent software.

Recommended web frameworks include **Django** and **Flask**, among others. The recommended webserver is **Gunicorn**. There are no restrictions around what software can be used (as long as it's pip-installable). Web processes must bind to `$PORT`, and only the HTTP protocol is permitted for incoming connections.

Python packages with C dependencies that are not [available on the base image](https://doc.scalingo.com/platform/internals/base-docker-image#top-of-page) are generally not supported, unless `manylinux` wheels are provided by the package maintainers (common).

See it in Action
----------------

```bash
$ ls
my-application		requirements.txt	runtime.txt

$ git push scalingo master
Counting objects: 4, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (4/4), 276 bytes | 276.00 KiB/s, done.
Total 4 (delta 0), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Python app detected
remote: -----> Installing python
remote: -----> Installing pip
remote: -----> Installing SQLite3
remote: -----> Installing requirements with pip
remote:        Collecting flask (from -r /tmp/build_c2c067ef79ff14c9bf1aed6796f9ed1f/requirements.txt (line 1))
remote:          Downloading ...
remote:        Installing collected packages: Werkzeug, click, MarkupSafe, Jinja2, itsdangerous, flask
remote:        Successfully installed Jinja2-2.10 MarkupSafe-1.1.0 Werkzeug-0.14.1 click-7.0 flask-1.0.2 itsdangerous-1.1.0
remote:
remote: -----> Discovering process types
remote:        Procfile declares types -> (none)
remote:
```

A `requirements.txt` must be present at the root of your application's repository to deploy.

See it in Action with Pipenv
----------------------------

Current default Python Runtime: Python 3.12.2

```bash
$ ls
Pipfile		Pipfile.lock	Procfile	web.py

$ scalingo create my-python-app

$ git push scalingo master
…
-----> Python app detected
-----> Installing python-3.11.2
-----> Installing pip
-----> Installing requirements with Pipenv 2023.2.18…
        ...
        Installing dependencies from Pipfile…
-----> Discovering process types
        Procfile declares types -> (none)
```

A `Pipfile` and a `Pipfile.lock` must be present at the root of your application's repository.

Specify a Buildpack Version
---------------------------

You can specify the latest production release of this buildpack for upcoming builds of an existing application:

```bash
scalingo env-set BUILDPACK_URL=https://github.com/Scalingo/python-buildpack
```

Specify a Python Runtime
------------------------

Supported runtime options include:

- `python-3.12.2` on all [supported stacks](https://doc.scalingo.com/languages/python/start)
- `python-3.11.8` on all [supported stacks](https://doc.scalingo.com/languages/python/start)
- `python-3.10.14` on all [supported stacks](https://doc.scalingo.com/languages/python/start)
- `python-3.9.19` on all [supported stacks](https://doc.scalingo.com/languages/python/start)
- `python-3.8.19` on scalingo-20 only
