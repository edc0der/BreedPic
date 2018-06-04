# BreedPic

BreedPic is an iOS app which aims to display pictures of dogs of different breeds. Currently Work in progress.

This is a learning experience for me as I entered the iOS development world by mantaining a couple of apps which were MVC (Massive view controller), spaghetti code all over the place:

Thanks to this project I've learned about:

- MVVM, model view viewmodel as architecture
- Alamofire routers and Moya targets
- Google sign-in to counter the lack of a backend of my own
- JSON decoding with Codable protocol
- Generic function creation whenever possible and necessary
- Overall best practices

## What?

Most of the list above has been removed, as in:

 - Instead of using Alamofire raw, Moya was left in its stead.
 - Google sign in was removed since I don't have my own backend to use the token, nor was I using the info. retrieved for anything other than displaying a name.
 - The generic function for array shuffling I created was removed. I did a [fork and pull request on the Dog Api](https://github.com/ElliottLandsborough/dog-ceo-api/pull/3), where I created an endpoint which removed the necessity for said shuffling function.
 There are still generics in the project but not all were created by me, they are popular solutions.

As this is the first project I created when I bought my MacBook, I was like TEST EVERYTHING YOU READ!!! and had a bit of a disaster. So I started cleaning up.

## Credits

I'm using the Dog API: https://dog.ceo/api, a project which can be found at https://github.com/ElliottLandsborough/dog-ceo-api.

I'm using Andrea Prearo's ImageLoadOperations script from his repo on smooth scrolling https://github.com/andrea-prearo/SwiftExamples/tree/master/SmoothScrolling/Client

I'm also using Ramotion's [Preview Transition pod](https://github.com/Ramotion/preview-transition) which looks awesome, to display the dog pictures.

I'll probably end up implementing the last by myself, 'cause I'm trying to do better animations by myself and not depend fully on third party code.

### Footnote
As I go along, I'll be updating both the project, as well as this file to keep up with latest results, objectives, etc.
