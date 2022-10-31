import httpclient, locks, os, strutils

proc allah(): void {.thread.} =
    while true:
        var
            client = newHttpClient()
        client.headers = newHttpHeaders({"User-Agent": "Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.0.6) Gecko/2009020911 Ubuntu/8.10 (intrepid) Mozilla/4.0 (compatible; MSIE 6.0; MSIE 5.5; Windows NT 5.1) Opera 7.03 [de]"})
        try:
            let res = client.request("https://profile-counter.glitch.me/TaxMachine/count.svg", HttpGet)
            if res.code == Http200: 
                echo "prout allah"
            elif res.code == Http403:
                echo "403: ratelimited"
                sleep(120000)
        except Exception:
            sleep(10000)

var
    t: Thread[void]
    cLock: Lock

initLock(cLock)
discard execShellCmd("clear")
for i in 0..15:
    createThread[void](t, allah)

joinThreads(t)