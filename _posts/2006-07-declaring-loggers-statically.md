title: declaring log4j loggers statically....or not?
date: 2006/07/03 21:00:00 -0700
tags: [code]
author: Jez Nicholson
alias: /declaring-log4j-loggers-statically

Logging is undeniably extremely useful, but I haven't quite worked out which strategy to use for creating loggers yet.

I've seen: protected final Log log = LogFactory.getLog(getClass()); used in AppFuse, which I assume means that you don't need to override in for subclasses. However, you can't log messages in static methods, as the logger is non-static.

In other systems I have declared a static logger: protected static Log log = LogFactory.getLog(Grid.class); and then overridden it in subclasses uses a static initializer (hurrah! I found a use for static initializers!) static { log = LogFactory.getLog(DateGrid.class); }

I guess that the first way is useful because you don't need to keep stating the class, but unless there's a good reason why (please comment....) then the static version is more helpful...or have I made a mistake somewhere?


Update (20th July 2006)
Thanks for all the comments. I realised that my whole static initialiser malarky was cobblers as of course it would make logging statements from Grid look like they came from DateGrid. I've settled on declaring a log object in each and every class file, but i am using the abstract commons.logging classes and not the specific log4j just to be pedantic

private static final org.apache.commons.logging.Log log = org.apache.commons.logging.LogFactory.getLog($CLASS_NAME$.class);

Which will be transient by definition as it is static.