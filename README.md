# Spring MVC Exercises

These are the practical exercises for the Spring Security module of the Entelect
Graduate Bootcamp 2018. This uses the web application you built in the Spring MVC
exercises as a starting point and then adds on some basic security functionality.

The format of the exercises is for you to check out a branch with the exercise in
its start state - these are named `exercise[0-9]`. Once you have the branch for
the exercise read the updated `README.md` for instructions on what you must
accomplish to complete the exercise.

The solution for each exercise will be in a branch named `solution[0-9]` - try
to complete the exercises on your own before looking at the solution...

It is recommended that branch off from each `exercise` branch when you start,
that makes it easy to commit and compare to the solution branch if you do get
stuck.

Begin by checking out the tag `exercise1` with `git checkout exercise1`.

## Exercise 1 (branch: `exercise1`)

To start with make sure that you can run the web application that has been
provided with bootRun and accessing it on `http://localhost:8080`.

Now we're going to add Spring Security and to start with we'll secure all
URIs to ensure that Spring Security is working.

Add this dependency to your `pom.xml`:

```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>
```

Add the class `za.co.entelect.bootcamp.config.WebSecurityConfig`, it should
extend `WebSecurityConfigurerAdapter`. Annotate it with `@Configuration` and
`@EnableWebSecurity`.

Then you should override as follows:
```
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        ...
    }
```

You configure security by chaining a number of method calls on the
`HttpSecurity` object. To start with configure it to require the user to be
logged in for all paths in the application as follows:

```
http
    .authorizeRequests() // Configure authorization
        .anyRequest().authenticated() // All requests must be authenticated
        .and()
    .httpBasic() // Use HTTP Basic authentication
        .and()
    .logout(); // Enable logout functionality, but note that it won't work for BASIC auth...
```

Now run the application and try to access it `http://localhost:8080`. You'll
see an HTTP Basic authentication dialog pop up, since you don't have a
username / password cancel it and you should a generic error page showing a
401 Unauthorized error.

To make the application work in its current state we need to add a user and
password. Luckily Spring Security makes it easy to stub in temporary users
for testing:

```
@Autowired
 public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
     auth
         .inMemoryAuthentication()
             .withUser("user").password("password").roles("USER");
 }
```

If you run again and log in with the username and password above, you should be
able to access the application pages again...
