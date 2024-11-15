# Upsun Developer Center

Small change

## Running locally

- Start Docker
- `git submodule init`
- `git submodule update`
- `docker-compose up --remove-orphans`

Visit the site at http://localhost:1313.

Cleaning up:

- `docker-compose down`
- `docker container prune`

## Running tests

Before merging a PR, it's a good idea to run the following tests.

1. Checking internal links

    ```bash
    ./tests/check_links/test.sh
    ```

2. Lint markdown/prose

    ```bash
    ./tests/check_lint/test.sh
    ```

3. (Scheduled) link checker

    ```bash
    ./tests/linkchecker/test.sh https://devcenter.upsun.com/
    ```
<!-- 
    or 

    ```bash
    ./tests/linkchecker/test.sh http://localhost:1313/
    ``` -->
