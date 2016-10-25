# Project 2 - *Yelp Client*

**Yelp Client** is a Yelp search app using the [Yelp API](http://www.yelp.com/developers/documentation/v2/search_api).

Time spent: **20** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] Search results page
   - [X] Table rows should be dynamic height according to the content height.
   - [X] Custom cells should have the proper Auto Layout constraints.
   - [X] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).
- [X] Filter page. Unfortunately, not all the filters are supported in the Yelp API.
   - [X] The filters you should actually have are: category, sort (best match, distance, highest rated), distance, deals (on/off).
   - [X] The filters table should be organized into sections as in the mock.
   - [X] You can use the default UISwitch for on/off states.
   - [X] Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.
   - [X] Display some of the available Yelp categories (choose any 3-4 that you want).

The following **optional** features are implemented:

- [X] Search results page
   - [X] Ability to filter by restaurant name

The following **additional** features are implemented:

- [X] Filter page has also Auto Layout constraints

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Better ways to design the Filter page (how to use ScrollView for example)
2. Auto Layout tips/tricks

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

- While building this app all the concepts we have been using started clicking better, however after setting up my tableview with the Auto Layout constraints something happened to my storyboard because when I opened the project the next day, all of the controls were completely spread out across the screen and I had to re-set them all in place and re-align the constraints.  I don't know if it's something I did or if it's somehow an Xcode bug, but this caused me to spend a huge amount of time first on trying to understand what happened, and then fixing it.  
- I can do way better on the design aspects of the app, but wasn't able to in part because of the issues I just explained above.

## License

    Copyright [2016] [David Bocardo]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.