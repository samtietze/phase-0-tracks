# HTTP Request Research
## Error Codes 101
As in the video, 200 codes are the most common, because it means something *worked*.
  - In general, any code starting with a 2 is a good sign, as it indicates success.
Much like everyone has experienced, the 404 is an example of a client-side error code.
  - 4xx refers to the client, 5xx refers to the server.

The most popular of these errors are: 403, 404, 500, 503, and 504.

* 404: although the user might not think they did something wrong, this is a client-side error. Usually it's because the link the user clicks is no longer available. If the user typed in a URL then it's a lot more easily defined as user-error.
* 403: This is the "forbidden" error. Usually it just means that the client doesn't have access to the page. Perhaps it's an administrative portal, or requires user login prior to entering the URL. It's possible that this could *technically* be a server-side issue in the sense that permissions are screwed up.
* 500: This is a basic server-side issue that isn't really defined. Usually it's on the programmer to define it, but it could also be a quick bug that is resolved by refreshing and attempting the operation again.
* 503: Server unavailable. This could be a number of things, just as with any computer. It could be rebooting, it could have lost connection, or it could be undergoing maintenance.
* 504: There could be a handful of causes, but this error refers to a timeout when waiting for information. This could be a gateway timeout between two servers, or the DNS might not be handed out appropriately. The result is tears from the user.


## GET vs POST
These are two separate types of form requests, and they're both pretty widely used. A GET request implies a static URL that one might frequently access (e.g. through a bookmark or a permalink). A POST request indicates the user is potentially sending sensitive data (e.g. a password) to a server, and the URL shouldn't be cached.
  - If you ever reload a page and it asks if you want to re-submit the data, this is because a POST request was used to generate the URL.

## Cookies
This is both the most helpful and the most insidious aspect of the web! The cookie is attached to a user's browser when they access a certain page, and it allows a server to have some semblance of consistency with the user.
For example, a user adding items to a shopping cart would be pretty annoyed if they had to re-add every item on their list. The cookie allows the website to remember *that* person and continuously populate the shopping cart they've built.
Another possibility is advertising: the age old revenue stream. This allows the server to track the user's footsteps, and analyze their patterns of behavior. Once this information is store alongside other useful info like the user's demographic, whoever owns the server can target ads or sell that data to partners.
If a user were to request a new page be opened, or even a new tab/window, the browser's cookie would let Amazon continue to show that they have three items in their shopping cart, regardless of what link they had clicked, or where they were now. Indeed, the user could navigate away from Amazon, then back to Amazon hours later, and their shopping cart items would still be there.