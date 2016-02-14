---
title: Agile testing numbers to words
date: 2006/04/12
tags: [agile]
author: Jez Nicholson
---
JUnit testing before/during coding can drastically improve the quality of your code. I've been coding a small util to convert numbers into words. First step was a quick google which soon threw up Réal Gagnon's EnglishDecimalFormat

Being an Agile-type Developer I wasn't happy that the tests were being done in main() as System.outs so I knocked up a test class. It produced results immediately, as Réal hadn't included the word 'and' in his output, as in the famous darts cry of, "one hundred and eighty!!!". As I added further (random) test cases I noticed a third variation with two 'and's 120001 = 'one hundred and twenty thousand and one'.

I know that this all sounds a bit sad, but there is a point:

A JUnit test that took 5 minutes to code paid off almost immediately by showing up potential errors.
The process of adding test cases makes you think about the problem more. Only by adding test cases did I think of 120001. That's why testing before or during coding will change the way you code....it makes you think about the problem and express the various outcomes.
random test cases are not enough. Coverage is vital. I should identify the potential combinations and have a test for each.

'''java

    import junit.framework.TestCase;
    
    /**
     * tests the EnglishDecimalFormat
     */
    public class EnglishDecimalFormatTest extends TestCase {
    
        public static void main(String[] args) {
            junit.swingui.TestRunner.run(EnglishDecimalFormatTest.class);
        }
    
        protected void setUp() throws Exception {
            super.setUp();
        }
    
        protected void tearDown() throws Exception {
            super.tearDown();
        }
    
        public final void testZero() {
            assertEquals("zero",EnglishDecimalFormat.convert(0));
        }
    
        public final void testOne() {
            assertEquals("one",EnglishDecimalFormat.convert(1));
        }
    
        public final void testTwo() {
            assertEquals("two",EnglishDecimalFormat.convert(2));
        }
    
        public final void testThree() {
            assertEquals("three",EnglishDecimalFormat.convert(3));
        }
    
        public final void testSixteen() {
            assertEquals("sixteen",EnglishDecimalFormat.convert(16));
        }
    
        public final void testTwentyNine() {
            assertEquals("twenty nine",EnglishDecimalFormat.convert(29));
        }
    
        public final void testOneHundred() {
            assertEquals("one hundred",EnglishDecimalFormat.convert(100));
        }
    
        public final void testOneHundredAndOne() {
            assertEquals("one hundred and one",EnglishDecimalFormat.convert(101));
        }
    
        public final void testOneHundredAndEighteen() {
            assertEquals("one hundred and eighteen",EnglishDecimalFormat.convert(118));
        }
    
        public final void testOneHundredAndTwenty() {
            assertEquals("one hundred and twenty",EnglishDecimalFormat.convert(120));
        }
    
        public final void testTwoHundred() {
            assertEquals("two hundred",EnglishDecimalFormat.convert(200));
        }
    
        public final void testTwoHundredAndOne() {
            assertEquals("two hundred and one",EnglishDecimalFormat.convert(201));
        }
    
        public final void testOneThousandThreeHundredAndSixteen() {
            assertEquals("one thousand three hundred and sixteen",EnglishDecimalFormat.convert(1316));
        }
    
        public final void testOneHundredThousand() {
            assertEquals("one hundred thousand",EnglishDecimalFormat.convert(100000));
        }
    
        public final void testOneHundredAndTwentyThousand() {
            assertEquals("one hundred and twenty thousand",EnglishDecimalFormat.convert(120000));
        }
    
        public final void testOneHundredAndTwentyThousandAndOne() {
            assertEquals("one hundred and twenty thousand and one",EnglishDecimalFormat.convert(120001));
        }
    
        public final void testOneMillion() {
            assertEquals("one million",EnglishDecimalFormat.convert(1000000));
        }
    
        public final void testThreeMillionTwoHundred() {
            assertEquals("three million two hundred",EnglishDecimalFormat.convert(3000200));
        }
    
        public final void testMinusFortyFive() {
            assertEquals("minus forty five",EnglishDecimalFormat.convert(-45));
        }
    
        public final void testOneHundredTwentyThreeMillionFourHundredFiftySixThousandSevenHundredAndEightyNine() {
            assertEquals("one hundred twenty three million four hundred fifty six thousand seven hundred and eighty nine",EnglishDecimalFormat.convert(123456789));
        }
    }
'''