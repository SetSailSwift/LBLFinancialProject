# LBLFinancialProject
<img width="375" alt="Screenshot 2023-12-04 at 8 56 14 PM" src="https://github.com/SetSailSwift/LBLFinancialProject/assets/5385810/a5e6c4fb-7830-4b9b-a72f-1e37e3f9a75a">
<img width="750" alt="Screenshot 2023-12-04 at 8 56 25 PM" src="https://github.com/SetSailSwift/LBLFinancialProject/assets/5385810/31cf62ba-c059-4c8f-bffd-3e3346fdf89b">

## Approach
### Design Pattern
With app being small, I used MVVM as the pattern for the app. This allowed me to separate the responsibilities of each component.
- Model: The current state of the app only required one model object, Comment. This was because the JSON response from the server only contains 1 structure type, which itself only contained basic types. 
This led me to believe the only need was for one model object to create.
- View: After reviewing the requirements, I was able to determine only three views would be needed
  - Cell: This view contains all the data to display related to the comment object it takes in.
  - ProfileImage: This view acts as the main component used to display the associated profile image.
  - BasicProfileImage: This view provides the type of image to display in ProfileImage, based upon the state
- ViewModel: The view models enable us to abstract the business logic from both the model and views, enabling them to be more lightweight and managable.
  - CommentsViewModel: This view model retrieves comments from the provided URL. While small in nature to start, future plans could include to implement pagination so that it can retrieve other comments as
the scrolling reaches the end of the page.
  - ProfileImageViewModel: This view model acts as the main handler for image selection and image state. When image selection occurs, the instance of the view model processes the selection, producing a ProgressView first
with either the selected image or failure image second.

### Utils
To best maintain separation of responsibilities further, a Utils group is added to contain other files that assist in the lifecycle of the app outside the design pattern. With the current state
of the app, I've added two files to handle two different things.
- Networking Manager: This struct is meant to handle all events that require the networking layer. When a request needs to be made to an API, this can be the one stop shop as the app grows. Currently it
it contains one URL but it can evolve to take in different URLs for different APIs and make the same calls but return different responses that match the supplied type.
- Modifiers: Here is where we can add custom modifiers that will meet our needs as the app scales. Currently, the only modifier added is DeviceRotationViewModifier which enables us to tell when the device orientation has changed.

### Design
I attempted to keep the original design requirements as stated in the docs but made a few adjustments. 
<img width="401" alt="Screenshot 2023-12-05 at 10 06 00 AM" src="https://github.com/SetSailSwift/LBLFinancialProject/assets/5385810/6688837c-e5b5-4fbe-b054-f7d10e81f64f">

To show a differentiation between portrait and landscape modes, I adjusted the portrait view to sort of mirror how a comments section maintains the profile data on the left side with the comment body on the right divided
by a divider, each comment separated by a divider as well to best separate the diffent comments. When in landscape mode, each comment is separated by a divider as well.

### TODO
The following topics are ideas I have as things to implement as the project were to scale:
- Create a profile view that displays the profile image, name, email, etc, that could display when profile section is tapped.
- Cache selected image and send to backend to store for later retrieval.
- Implement pagination for retreiving more comments as user scrolls through.
- Enable adding/editing comments from user side then posting to backend.

## Result
![Project-final](https://github.com/SetSailSwift/LBLFinancialProject/assets/5385810/77d66f59-442a-45b7-aa91-73c9ed66ca90)
