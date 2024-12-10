# Buildpack: Python

This is the official [Scalingo buildpack](https://doc.scalingo.com/buildpacks)
for Python apps, powered by [Pipenv](https://docs.pipenv.org/), [pip](https://pip.pypa.io/)
and other excellent software.

Recommended web frameworks include **Django** and **Flask**, among others. The
recommended webserver is **Gunicorn**. There are no restrictions around what
software can be used (as long as it's pip-installable). Web processes must bind
to `$PORT`, and only the HTTP protocol is permitted for incoming connections.

Python packages with C dependencies that are not [available on the base image](https://doc.scalingo.com/platform/internals/stacks/stacks)
are generally not supported, unless `manylinux` wheels are provided by the
package maintainers (common).

## Application Requirements

A `requirements.txt`, `Pipfile` or `poetry.lock` file must be present in the
root (top-level) directory of your app's source code.

## Configuration

### Python Version

We recommend that you specify a Python version for your app rather than relying
on the buildpack's default Python version.

For example, to request the latest patch release of Python 3.13, create a
`.python-version` file in the root directory of your app containing: `3.13`

The buildpack will look for a Python version in the following places (in
descending order of precedence):

1. `runtime.txt` file (deprecated)
2. `.python-version` file (recommended)
3. The `python_full_version` field in the `Pipfile.lock` file
4. The `python_version` field in the `Pipfile.lock` file

If none of those are found, the buildpack will use a default Python version for
the first build of an app, and then subsequent builds of that app will be
pinned to that version unless the build cache is cleared or you request a
different version.

The current default Python version is: 3.13

The supported Python versions are:

- Python `3.13`
- Python `3.12`
- Python `3.11`
- Python `3.10`

These Python versions are deprecated on Scalingo:

- Python `3.9`
- Python `3.8` (only available on the [scalingo-20](https://doc.scalingo.com/platform/internals/stacks/scalingo-20-stack) stack)

Python versions older than those listed above are no longer supported, since
they have reached end-of-life [upstream](https://devguide.python.org/versions/#supported-versions).

## Documentation

For more information about using Python on Scalingo, see [our documentation](https://doc.scalingo.com/languages/python/start).
