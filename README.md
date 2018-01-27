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

## Exercise 2 (branch: `exercise2`)

We have some basic security in place now, but there are several problems with
our setup:
 * All pages are blocked unless you have a login, so we are unlikely to be able
 convince prospective users to use our site.
 * HTTP Basic authentication is ugly and does not fit the style of the site.
 * HTTP Basic authentication does not allow the user to logout.

### Part 1: Finer grained authorization

Since it's impossible to log out of HTTP Basic authentication, remove
`httpBasic()` from your security configuration, then  tweak the
`authorizeRequests` section of the security configuration as follows:
 * `/`: Freely accessible.
 * `/report/**`: Freely accessible.
 * `/superheroes/**`: Require role `USER` to add or delete heroes.

Restart and test by browsing around the site... you should see access denied
errors when trying to add or delete a hero. 

### Part 2: Login and logout

Add `.formLogin()` to your `HttpSecurity` configuration, run the application
and try adding a hero again. You'll be redirected to an ugly, but functional
login page and if you put in the username and password you will be able to
proceed.

We'd like to add a nicer login page, but before that let's add logout
functionality first, otherwise it will be very difficult to log out so you
can test your shiny new login page...

First add a Maven dependency for the Spring Security JSP taglibs:

```
<dependency>
    <groupId>org.springframework.security</groupId>
    <artifactId>spring-security-taglibs</artifactId>
</dependency>
```

Now you'll see that the navigation section of the pages has been stripped
out into a JSP fragment in `nav.jspf`. First add the taglib to it:

```
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
```
 
Then add the following snippet to `nav.jspf` after the `</ul>` tag:

```
<sec:authorize access="isAuthenticated()">
    <form:form action="/logout" method="post" cssClass="navbar-form navbar-right">
        <div class="form-group">
            <input type="submit" value="Sign Out" class="btn btn-link"/>
        </div>
    </form:form>
</sec:authorize>
```

Run the application, try to add a hero, log in and then verify that a logout
link appears in the navigation. If you hit the logout button you will be
redirected back to the login page and message will be shown saying that you
have successfully logged out.

### Part 3: Custom login page 

Finally, let's make the login page a bit prettier and more consistent with the
design of our application...

First make a copy of `index.jsp` called `login.jsp` we'll edit this page to
add the necessary functionality for login. Replace the welcome section with
a login form:

```
<h1>Login</h1>

<form action="/login" method="post">
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}"/>

    <div class="form-group">
        <label for="username">Username</label>
        <input name="username" id="username" />
    </div>

    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" name="password" id="password"/>
    </div>

    <c:if test="${param.error != null}">
        <div class="form-group">
            <div class="alert alert-danger" role="alert">
                <p>Invalid username or password.</p>
            </div>
        </div>
    </c:if>

    <button name="submit" class="btn btn-primary">Login</button>
</form>
```

Now to start using this custom login page we need a few things:
 * Add a `LoginController` that will serve `login.jsp` on the `/login`
 URI - your easiest option is to copy `HomeController` and tweak it.
 * Configure the paths that are freely accessible in your security
 configuration to include `/login`.
 * Configure the `formLogin()` section of your security configuration
 with `.loginPage("/login")` to tell Spring Security what page to use
 for logging in.

Run the application and verify that you now get a prettier login page
when you try to add or delete a hero.