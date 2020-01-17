# TestTaskSaveliyRadchyck
Design and implement an iOS application using Swift programming language with the following features:
1. The first screen would contain two input fields and one button.
1.1. The input fields would require the user to input two different numbers, lower bound and upper bound
1.2. After inputting the numbers, the user can press the button
2. Pressing the button would present the user in another screen the result of comments from an API call to https://jsonplaceholder.typicode.com
2.1. Please refer to the API documentation to see how to get comments data from the server.
3. The comments that would be displayed on the screen would be sorted by id (ascending order). And only the comments with ids between the lower bound and the upper bound would be displayed.
4. Display only 10 comments on the screen and use infinity scroll to load and present the rest.
4.1. It would be best for the challenge purpose if the client would send requests to download from the server only the comments needed for displaying currently (10 each time for example)
