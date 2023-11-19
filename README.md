# Reproducing the number formatter issue

> 1. Run `make run` to start the docker containers
> 2. Run `make test` to run the test with PHP 8.1.3
> 3. Run `make test-new` to run the test with PHP 8.1.25

```php
$formatter = new NumberFormatter('de_DE', NumberFormatter::DECIMAL);
$result = $formatter->parse('100,01') 

// Expected: 100.01
// Actual: false
```

#### Output for PHP 8.1.3

---
![make test](./test-run.png)

#### Output for PHP 8.1.25

---

![make test new](./test-run-new.png)
