<?php

declare(strict_types=1);

use PHPUnit\Framework\TestCase;

class NumberFormatterTest extends TestCase
{
    /**
     * @dataProvider provideValidValues
     */
    public function testEuropeanFormat(string $stringValue, float $parsedValue): void
    {
        $formatter = new NumberFormatter('de_DE', NumberFormatter::DECIMAL);

        $this->assertSame($parsedValue, $formatter->parse($stringValue));
    }

    public function provideValidValues(): array
    {
        return [
            ['100,01', 100.01],
            ['1.100,01', 1100.01],
            ['1.000.100,01', 1000100.01],
            ['10,00', 10],
        ];
    }
}
