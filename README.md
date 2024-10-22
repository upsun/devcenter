# Upsun Developer Center

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

## Viewing data 

### [Using `ngxtop` ](https://support.platform.sh/hc/en-us/community/posts/16439708490002-How-to-derive-metrics-from-access-log-via-ngxtop)

Everything below assumes these first steps:

```bash
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
```

1. Web traffic overview

    ```bash
    upsun log access -p 5c2jjy3p7slv6 -e main --lines 102400 | env/bin/ngxtop --no-follow
    ```

    Which results in output similar to the following

    ```bash
    $ upsun  log access -p 5c2jjy3p7slv6 -e main --lines 202400 | env/bin/ngxtop --no-follow --limit 100                   
    Reading log file 5c2jjy3p7slv6-main-bvxea6i--devcenter@ssh.ca-1.platform.sh:/var/log/access.log
    running for 5 seconds, 48434 records processed: 10074.07 req/sec

    Summary:
    |   count |   avg_bytes_sent |   2xx |   3xx |   4xx |   5xx |
    |---------+------------------+-------+-------+-------+-------|
    |   48434 |        74409.937 | 41329 |  6576 |    28 |   501 |

    Detailed:
    | request_path                                                                                              |   count |   avg_bytes_sent |   2xx |   3xx |   4xx |   5xx |
    |-----------------------------------------------------------------------------------------------------------+---------+------------------+-------+-------+-------+-------|
    | /                                                                                                         |    1870 |       117703.610 |  1843 |    27 |     0 |     0 |
    | /community/                                                                                               |    1503 |        90527.685 |  1502 |     1 |     0 |     0 |
    | /search                                                                                                   |    1302 |          162.000 |     0 |  1302 |     0 |     0 |
    | /search/                                                                                                  |    1238 |        20655.911 |  1233 |     5 |     0 |     0 |
    | /community                                                                                                |    1232 |          162.000 |     0 |  1232 |     0 |     0 |
    | /lib/flexsearch/flexsearch.bundle.min.0425860527cc9968f9f049421c7a56b39327d475e2e3a8f550416be3a9134327.js |    1197 |        15419.209 |  1197 |     0 |     0 |     0 |
    | /en.search.min.18ac67ea9b25fad7fe4af030542ac1edb7b51c04cc562f96c8eb555327bde985.js                        |     958 |         6424.000 |   958 |     0 |     0 |     0 |
    | /js/main.min.82ab41c285e203bbf22ca6b45743aa60857e566fe56f3ee56baa2ac3a56c69d5.js                          |     954 |         5011.962 |   954 |     0 |     0 |     0 |
    | /posts/                                                                                                   |     889 |        59386.217 |   885 |     4 |     0 |     0 |
    | /css/compiled/main.min.c1fe2c80102c9dc9ddc66184191e646769052d36a21b38ac5ab5077713cf7a81.css               |     836 |        61941.804 |   836 |     0 |     0 |     0 |
    | /site.webmanifest                                                                                         |     808 |          391.593 |   793 |    15 |     0 |     0 |
    | /videos/                                                                                                  |     785 |        55030.904 |   785 |     0 |     0 |     0 |
    | /android-chrome-192x192.png                                                                               |     762 |        13425.000 |   762 |     0 |     0 |     0 |
    | /community/content/posts/                                                                                 |     722 |        65543.418 |   722 |     0 |     0 |     0 |
    | /community/content/videos/                                                                                |     715 |        62494.017 |   715 |     0 |     0 |     0 |
    | /posts                                                                                                    |     692 |          162.000 |     0 |   692 |     0 |     0 |
    | /images/logos/devcenter_light.svg                                                                         |     675 |         9379.793 |   675 |     0 |     0 |     0 |
    | /videos                                                                                                   |     674 |          162.000 |     0 |   674 |     0 |     0 |
    | /community/about/conduct/                                                                                 |     580 |        57424.778 |   580 |     0 |     0 |     0 |
    | /images/logo_upsun_light.svg                                                                              |     556 |          578.000 |   556 |     0 |     0 |     0 |
    | /images/logo_upsun_dark.svg                                                                               |     556 |          588.000 |   556 |     0 |     0 |     0 |
    | /community/about/cla/                                                                                     |     544 |        58214.395 |   543 |     1 |     0 |     0 |
    | /community/engage/discord/                                                                                |     538 |        51159.370 |   537 |     1 |     0 |     0 |
    | /images/logo_horizontal.svg                                                                               |     534 |        18367.000 |   534 |     0 |     0 |     0 |
    | /community/engage/discord/faq/                                                                            |     519 |        56408.291 |   518 |     1 |     0 |     0 |
    | /images/background-purple.webp                                                                            |     491 |        15960.000 |   491 |     0 |     0 |     0 |
    | /images/upsun-hello-world.svg                                                                             |     486 |        26281.259 |   486 |     0 |     0 |     0 |
    | /community/content/posts                                                                                  |     467 |          162.000 |     0 |   467 |     0 |     0 |
    | /community/content/videos                                                                                 |     464 |          162.000 |     0 |   464 |     0 |     0 |
    | /images/background-blue.webp                                                                              |     458 |        27682.000 |   458 |     0 |     0 |     0 |
    | /css/compiled/main.min.d435aea8cb8e50ae331fa05c76c556d6671b779c17028efb401727d49467b44d.css               |     415 |        74827.000 |   415 |     0 |     0 |     0 |
    | /community/about/contributing/                                                                            |     415 |        56781.267 |   414 |     1 |     0 |     0 |
    | /posts/introducing-dev-center/                                                                            |     405 |        48848.217 |   404 |     1 |     0 |     0 |
    | /community/engage/people/                                                                                 |     368 |        74664.755 |   368 |     0 |     0 |     0 |
    | /apple-touch-icon.png                                                                                     |     348 |        12572.000 |   348 |     0 |     0 |     0 |
    | /images/dev-center-upsun-sun.svg                                                                          |     338 |        55016.337 |   338 |     0 |     0 |     0 |
    | /community/engage/events/                                                                                 |     314 |        57286.408 |   314 |     0 |     0 |     0 |
    | /favicon.svg                                                                                              |     281 |          531.594 |   281 |     0 |     0 |     0 |
    | /images/red-background.webp                                                                               |     270 |        21090.000 |   270 |     0 |     0 |     0 |
    | /css/custom.min.818f3d2bac781dddd571e70f24b5d1416549279ed789898dead2e9094044e105.css                      |     270 |         9096.000 |   270 |     0 |     0 |     0 |
    | /videos/orrxx4japwc/                                                                                      |     250 |        36392.512 |   248 |     2 |     0 |     0 |
    | /posts/on-preview-environments/                                                                           |     248 |        81617.194 |   234 |     0 |     0 |    14 |
    | /posts/experiments/                                                                                       |     244 |        35209.918 |   244 |     0 |     0 |     0 |
    | /posts/discussions/                                                                                       |     243 |        39820.103 |   243 |     0 |     0 |     0 |
    | /posts/releases/                                                                                          |     242 |        35082.657 |   241 |     1 |     0 |     0 |
    | /posts/tutorials/                                                                                         |     241 |        37599.631 |   241 |     0 |     0 |     0 |
    | /css/custom.min.94f84c17f30fb5c61abf7fbd4cce9fc8a3a8b63bc91f65701b4ff4da922609c6.css                      |     241 |         5421.000 |   241 |     0 |     0 |     0 |
    | /posts/introducing-dev-center                                                                             |     240 |          162.000 |     0 |   240 |     0 |     0 |
    | /posts/how-it-works/                                                                                      |     240 |        35701.671 |   240 |     0 |     0 |     0 |
    | /js/main.min.f8f93c258f3ebe049f7f422ac0be93a8f83e2d0adc118391d657f571173a3dc7.js                          |     235 |         6367.000 |   235 |     0 |     0 |     0 |
    | /community/content/posts/introducing-dev-center/                                                          |     230 |        67849.848 |   230 |     0 |     0 |     0 |
    | /posts/use-cases/                                                                                         |     221 |        33687.434 |   221 |     0 |     0 |     0 |
    | /posts/compare/                                                                                           |     220 |        32479.300 |   220 |     0 |     0 |     0 |
    | /posts/how-tos/                                                                                           |     219 |        33384.836 |   219 |     0 |     0 |     0 |
    | /posts/transcripts/                                                                                       |     218 |        33763.706 |   218 |     0 |     0 |     0 |
    | /posts/preview-environments-a-developers-secret-weapon/                                                   |     214 |        25899.766 |   213 |     1 |     0 |     0 |
    | /videos/podcasts/                                                                                         |     210 |        32110.805 |   209 |     1 |     0 |     0 |
    | /images/preview-environments-a-developers-secret-weapon/branches.jpg                                      |     197 |      4519071.274 |   197 |     0 |     0 |     0 |
    | /css/custom.min.90117267c8ade410fb607882f9b132a69e78dac0ec9054d1a92d0b1b7c86efd6.css                      |     196 |         6171.821 |   195 |     0 |     0 |     1 |
    | /css/custom.min.ac5b9922cb60386999732be7910d6b2ecb9ff51e1d2f1276feff2b631c9aa7c9.css                      |     186 |         9042.075 |   184 |     0 |     0 |     2 |
    | /images/devcenter.png                                                                                     |     171 |        32754.000 |   171 |     0 |     0 |     0 |
    | /images/psh-console-main-view.png                                                                         |     169 |      5115869.302 |   169 |     0 |     0 |     0 |
    | /favicon-dark.svg                                                                                         |     167 |          940.120 |   167 |     0 |     0 |     0 |
    | /en.search.min.ff87aa7066365b46656bcb3fd78dc0b7edae5086a10a223b51b7d40e305ee33a.js                        |     164 |         3538.000 |   164 |     0 |     0 |     0 |
    | /community/engage/people/gmoigneu/                                                                        |     156 |        41365.853 |   152 |     4 |     0 |     0 |
    | /images/transaction-breakdown-3.webp                                                                      |     154 |       127006.000 |   154 |     0 |     0 |     0 |
    | /images/flame-graph.png                                                                                   |     153 |        34546.000 |   153 |     0 |     0 |     0 |
    | /community/about/contributing/about/                                                                      |     149 |        54623.027 |   148 |     1 |     0 |     0 |
    | /posts/preview-environments-a-developers-secret-weapon                                                    |     148 |          162.000 |     0 |   148 |     0 |     0 |
    | /posts/automate-with-gatling-1/                                                                           |     146 |        35885.014 |   144 |     2 |     0 |     0 |
    | /community/posts/                                                                                         |     145 |        59887.000 |   145 |     0 |     0 |     0 |
    | /community/media/                                                                                         |     145 |        54268.000 |   145 |     0 |     0 |     0 |
    | /community/engage/people/chadwcarlson/                                                                    |     141 |        42830.206 |   141 |     0 |     0 |     0 |
    | /images/sun-walk.png                                                                                      |     131 |        97613.000 |   131 |     0 |     0 |     0 |
    | /community/content/posts/on-preview-environments/                                                         |     130 |        75145.500 |   130 |     0 |     0 |     0 |
    | /robots.txt                                                                                               |     125 |           11.960 |   115 |    10 |     0 |     0 |
    | /videos/talks/                                                                                            |     120 |        27235.758 |   118 |     2 |     0 |     0 |
    | /lib/katex/katex.min.9f45307c5794ed247a0d095f3a62e52ef2215a67b2327203a7fd919959ae79d1.js                  |     120 |       194105.825 |   120 |     0 |     0 |     0 |
    | /lib/katex/auto-render.min.7b57d427ac6270677daf8d8380ded2cc73336f9149a167b8e1fe0d6ef66604ae.js            |     117 |         2787.462 |   117 |     0 |     0 |     0 |
    | /videos/demos/                                                                                            |     116 |        29386.638 |   116 |     0 |     0 |     0 |
    | /lib/katex/mhchem.min.f0ca03df194b8c3d6017ff455db6a0ef98857905663fa311a6cded788b15340b.js                 |     116 |        23314.612 |   116 |     0 |     0 |     0 |
    | /videos/livestreams/                                                                                      |     115 |        25401.157 |   115 |     0 |     0 |     0 |
    | /videos/webinars/                                                                                         |     114 |        25624.649 |   113 |     1 |     0 |     0 |
    | /community/content/videos/8hg-wheh_68/                                                                    |     112 |        60164.205 |   112 |     0 |     0 |     0 |
    | /lib/katex/katex.min.7e5db7914b97e596a36c1abb67ccc7f174f8bb71d38c9a88c55b262ed1737f97.css                 |     111 |        13922.189 |   111 |     0 |     0 |     0 |
    | /community/about/contributing/local/                                                                      |     109 |        47864.440 |   108 |     1 |     0 |     0 |
    | /favicon.ico                                                                                              |     107 |        15406.000 |   107 |     0 |     0 |     0 |
    | /community/engage/people/flovntp/                                                                         |     106 |        42859.594 |   106 |     0 |     0 |     0 |
    | /videos/orrxx4japwc                                                                                       |     100 |          162.000 |     0 |   100 |     0 |     0 |
    | /community/content/posts/infra-events-multi-app/                                                          |     100 |        75052.620 |   100 |     0 |     0 |     0 |
    | /community/about/contributing/format/                                                                     |     100 |        77248.510 |    99 |     1 |     0 |     0 |
    | /css/custom.min.3c50796ab87b2307c42b261f7a5de0aeb2a2539fb60f50322d5f4ffb4278a80b.css                      |      98 |         4239.000 |    98 |     0 |     0 |     0 |
    | /community/engage/people/gregqualls/                                                                      |      97 |        42263.567 |    95 |     2 |     0 |     0 |
    | /community/engage/discord/rules/                                                                          |      95 |        39346.126 |    94 |     1 |     0 |     0 |
    | /community/about/contributing/style/                                                                      |      94 |        41846.532 |    93 |     1 |     0 |     0 |
    | /community/about/contributing/posts/                                                                      |      94 |        63866.553 |    93 |     1 |     0 |     0 |
    | /videos/9eezgt81ago/                                                                                      |      91 |        24712.758 |    88 |     3 |     0 |     0 |
    | /posts/on-preview-environments                                                                            |      91 |          173.319 |     0 |    89 |     0 |     2 |
    | /community/about/contributing/videos/                                                                     |      91 |        67802.857 |    90 |     1 |     0 |     0 |
    | /images/background-yellow.webp                                                                            |      90 |        32908.000 |    90 |     0 |     0 |     0 |
    ```

2. View top visitors

    ```bash
    upsun log access -p 5c2jjy3p7slv6 -e main --lines 102400 | env/bin/ngxtop --no-follow top remote_addr http_user_agent
    ```

    ```bash
    $ upsun log access -p 5c2jjy3p7slv6 -e main --lines 102400 | env/bin/ngxtop --no-follow top remote_addr http_user_agent
    Reading log file 5c2jjy3p7slv6-main-bvxea6i--devcenter@ssh.ca-1.platform.sh:/var/log/access.log
    running for 5 seconds, 48434 records processed: 10227.21 req/sec

    top remote_addr
    | remote_addr    |   count |
    |----------------+---------|
    | 73.35.9.17     |   10653 |
    | 88.121.211.206 |    6283 |
    | 96.8.130.150   |    2929 |
    | 64.85.212.139  |    2927 |
    | 104.56.80.121  |    1912 |
    | 88.171.74.202  |    1542 |
    | 72.14.148.34   |     805 |
    | 13.234.195.28  |     560 |
    | 213.149.51.23  |     501 |
    | 88.186.115.67  |     491 |

    top http_user_agent
    | http_user_agent                                                                                                                                    |   count |
    |----------------------------------------------------------------------------------------------------------------------------------------------------+---------|
    | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36                              |   14295 |
    | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36                              |   12881 |
    | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36                              |    3084 |
    | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36                              |    1708 |
    | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36                                              |    1213 |
    | Mozilla/5.0 (compatible; Google-Apps-Script; beanserver; +https://script.google.com; id: UAEmdDd_fohs4lYCvlND6hRx0ZRkpWCBscg)                      |     848 |
    | Mozilla/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Mobile/15E148 Safari/604.1 Ddg/17.6 |     791 |
    | Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36                                    |     703 |
    | Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:129.0) Gecko/20100101 Firefox/129.0                                                               |     681 |
    | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 (compatible; Screenshot-Psh/1.0)         |     656 |

    ```

3. Filter by IP address

    ```bash
    upsun log access -p 5c2jjy3p7slv6 -e main --lines 102400 | env/bin/ngxtop --no-follow -i 'remote_addr == "73.35.9.17"' top request status http_user_agent
    ```

    Which gives:

    ```bash
    $ upsun log access -p 5c2jjy3p7slv6 -e main --lines 102400 | env/bin/ngxtop --no-follow -i 'remote_addr == "73.35.9.17"' top request status http_user_agent
    Reading log file 5c2jjy3p7slv6-main-bvxea6i--devcenter@ssh.ca-1.platform.sh:/var/log/access.log
    running for 7 seconds, 10653 records processed: 1473.06 req/sec

    top request
    | request                                                                                                                |   count |
    |------------------------------------------------------------------------------------------------------------------------+---------|
    | GET /community/ HTTP/1.1                                                                                               |     386 |
    | GET / HTTP/1.1                                                                                                         |     378 |
    | GET /search/ HTTP/1.1                                                                                                  |     314 |
    | GET /search HTTP/1.1                                                                                                   |     314 |
    | GET /lib/flexsearch/flexsearch.bundle.min.0425860527cc9968f9f049421c7a56b39327d475e2e3a8f550416be3a9134327.js HTTP/1.1 |     284 |
    | GET /community HTTP/1.1                                                                                                |     281 |
    | GET /en.search.min.18ac67ea9b25fad7fe4af030542ac1edb7b51c04cc562f96c8eb555327bde985.js HTTP/1.1                        |     266 |
    | GET /js/main.min.82ab41c285e203bbf22ca6b45743aa60857e566fe56f3ee56baa2ac3a56c69d5.js HTTP/1.1                          |     230 |
    | GET /community/content/videos/ HTTP/1.1                                                                                |     222 |
    | GET /community/content/posts/ HTTP/1.1                                                                                 |     221 |

    top status
    |   status |   count |
    |----------+---------|
    |      200 |    9153 |
    |      301 |    1412 |
    |      502 |      61 |
    |      206 |      26 |
    |      403 |       1 |

    top http_user_agent
    | http_user_agent                                                                                                                                    |   count |
    |----------------------------------------------------------------------------------------------------------------------------------------------------+---------|
    | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36                              |    5828 |
    | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36                              |    2410 |
    | Mozilla/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Mobile/15E148 Safari/604.1 Ddg/17.6 |     791 |
    | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36                              |     620 |
    | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36                              |     164 |
    | Mozilla/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Mobile/15E148 Safari/604.1          |     155 |
    | Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:130.0) Gecko/20100101 Firefox/130.0                                                               |     145 |
    | Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36                |     137 |
    | htmltest/0.17.0                                                                                                                                    |     129 |
    | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36                              |     107 |
    ```

### [With GoAccess.io](https://support.platform.sh/hc/en-us/community/posts/16439473183122-How-to-visualize-Access-Logs-with-a-fancy-interface-and-charts)

```bash
upsun log -p 5c2jjy3p7slv6 -e main access --lines 102400 | goaccess --log-format=COMBINED -o dev/public/access/report.html --real-time-html -
```
