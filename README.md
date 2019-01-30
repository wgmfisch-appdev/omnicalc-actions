# Omnicalc Actions

## Introduction

The goal of this project is to get more practice with writing Ruby programs. You will execute the code simply by visiting a particular URL in your browser. **Your visit will trigger the execution of the Ruby code, and the output will appear in your browser window.**

## Target

Ultimately, you will build this application:

http://omnicalc-actions.herokuapp.com/

It is a collection of calculators that do various things; count the number of words in a block of text, the monthly payment for a loan, etc. Over time, we may add more and more calculators if we feel like it (if you have a suggestion for a calculator you think we should add, please let us know).


## Part 1

### Setup

 1. [Setup the project on Cloud9 using this process.](https://guides.firstdraft.com/getting-started-with-cloud9.html)
 1. Now paste the URL of your running application into a Chrome tab (or click the underlined URL that appears in the terminal when you run the project). If all went well, you should see the New Word Count form. If not, let us know.
 1. Type in some text and submit the form.
 1. On the results page, you will currently see just a bunch of placeholders. Your job will be to replace the placeholders with correctly computed values.
 1. In Cloud9, find the `/app/controllers/word_count_controller.rb` file.
 1. Locate the part of the file that looks like this:

        def word_count
          @text = params[:user_text]
          @special_word = params[:user_word]

          # ================================================================================
          # Your code goes below.
          # The text the user input is in the string @text.
          # The special word the user input is in the string @special_word.
          # ================================================================================


          @character_count_with_spaces = "Replace this string with your answer."

          @character_count_without_spaces = "Replace this string with your answer."

          @word_count = "Replace this string with your answer."

          @occurrences = "Replace this string with your answer."
        end

 1. The code between the `def word_count` and `end` is the program that gets executed. I have already written some code that retrieves the inputs from the form and places them into variables for you to use, `@text` and `@special_word`.
 1. Your job is to write code below the comments and, ultimately, store the correct values in the variables I created at the bottom of the method. For example, to solve the first part, call `.length` on the user's input, `@text`, and assign the result to `@character_count_with_spaces`.

        @character_count_with_spaces = @text.length

 1. You have to figure out how to calculate the correct value for the rest: `@character_count_without_spaces`, `@word_count`, and `@occurrences`. Don't change the names of these variables; if you do, your results won't appear in the browser in the end.
 1. Refresh the results page in your browser to re-run your code and see new output.
 1. You can write as much or as little code as it takes to produce the correct answer; create intermediate variables if you want, or do anything else that you learned about from class. It's all just the same Ruby as before.
 1. Keep working; your goal is to make your application behave exactly like the target. Next, work on the [Loan Payment calculator](http://localhost:3000/loan_payment/new). You'll again be working in the same file, `/app/controllers/calculations_controller.rb`. This time, scroll down to the method `def loan_payment` and write your code in there as indicated by the comments. You can find the formula at the end of the "Monthly payment formula" section of [this article](https://en.wikipedia.org/wiki/Mortgage_calculator#Monthly_payment_formula).
 1. As you work, remember to navigate to `/git` and **commit often as you work.**
 1. Make new branches freely to experiment! _Especially_ before starting on a new task.
 1. Some tasks are easier, some are much harder. For example, in the Descriptive Statistics calculator, finding the mode (the number that occurs most frequently in a list of numbers) is surprisingly hard. Do your best, but don't get discouraged if you can't quite solve it without asking questions.
 1. The [Introduction to Ruby](https://guides.firstdraft.com/introduction-to-ruby.html) contains enough tools to solve all of the Omnicalc challenges. (You can build up almost anything from scratch given conditionals, loops, and variables.) You should attempt to solve it using the tools you've already seen.
 1. For the mode calculation, just worry about the simplest case; when there's one number that occurs most frequently, that should be shown as the mode. I won't be testing the case that there's a tie.
 1. When you're ready for some automated feedback, run `rails grade` in a Terminal tab. There will be a bunch of output; don't be intimidated! Try to read through it and make sense of it; ask questions on Piazza, and we'll discuss in detail next week.
 1. Ask lots of questions!

## Part 2

For instructions on Part 2, please see [this guide](https://guides.firstdraft.com/meteorologist-exercise-guide.html)

## Part 3

For this section, we're going to be extending your work with APIs by exploring a machine learning API marketplace called [Algorithmia](https://algorithmia.com/). It's a fantastic resource that connects us to a large number of machine learning APIs, including many that do text and image analysis.

You'll get practice using forms to capture and process user input using some interesting applications including:

 - a service that auto-tags large blocks of text
 - a service that colorizes black and white images
 - a service that auto-tags images with descriptive keywords

### API Setup

First, visit [Algorithmia](https://algorithmia.com/) and sign up for an account. You'll be able to find your API keys by visiting 'https://algorithmia.com/users/[your username]' or by clicking on the profile icon at the top right and clicking the 'My API Keys' link. You'll need this key to complete the homework exercises below.

We'll also need to make sure your API key stays hidden, in case your project ever gets pushed to GitHub or another public repository. Unsavory types like to scrape GitHub for sensitive information like API keys and run up huge bills for compromised users. In this specific case, you didn't have to tie your API key to a credit card, but protecting your API keys is generally good practice.

We can do this fairly easily in your workspace:

> If you realize you've made an error on any of the following steps, just type in `cd ~/workspace` and hit enter. That should get you back to the starting point.

1. Type in `cd ~` and hit enter. This command should take you to the home folder of your workspace.
1. Type in `touch .bash_profile` and hit enter. This command creates a hidden file called `.bash_profile` in your home folder.
1. Type in `ls -a` and hit enter. You'll see a list of all the files in your current directory, including hidden files (the ones whose names start with a `.`).
1. Mouse over the filename `.bash_profile` and click it. The file should open up in your editor.
1. Paste in the following code into the file but make sure to use your own Algorithmia key on the right side of the `=` sign

    ```bash
    export ALGORITHMIA_KEY="replace_me_with_your_key"
    ```

    Note: don't put spaces around the `=`.

1. Back in Terminal, type in `cd ~/workspace` to go back to your main folder, or just close that tab.

    > If you ever need to reopen your bash profile, type `cd ~`, hit enter, then type `ls -a`, hit enter and click on the file to open it.

1. If you have a Rails server running, stop it and re-start it.
1. The values that we `export` in the `.bash_profile` file become key-value pairs in a special Hash that we can access anywhere in our Rails environment called `ENV`. For example, to access this sensitive info, **in a NEW Terminal tab** (it won't work in old tabs) we can open a `rails console` and type in:

    ```ruby
    ENV.fetch("ALGORITHMIA_KEY")
    ```

    and we should see output of

    ```ruby
    => "replace_me_with_your_key"
    ```

You can use this pattern throughout your Rails app to store and use sensitive info but prevent it from showing on GitHub when you push your code up, or from unauthorized visitors being able to see it in your public Cloud9 workspaces.

### Problem 1 - Auto-tag Text

The first service we'll use extracts tags from blocks of text; for example, if you paste in the contents of a news article, it will try to extract keywords.

Here's how it should work:

- If I visit `/text-tag`, I should see a form that has a single textarea element which lets me enter text for tagging. (For example, you can copy the text of [Paul Graham's essay, _How to Get Startup Ideas_](http://paulgraham.com/startupideas.html).)
- The textarea should have a label of `Text` and the button you click to submit the form should be called `Generate Tags`.
- When the form is submitted, I should see an unordered list of tags corresponding to the submitted text. If you used the example text, you should see the following tags:

    ```
    build
    good
    idea
    ideas
    people
    startup
    things
    users
    ```

The ability to, given a blob of text, automatically extract keywords from it is pretty powerful! Using this technique you could, for example, automatically categorize blog posts.

Visit the [AutoTag page](https://algorithmia.com/algorithms/nlp/AutoTag), and near the bottom find the Ruby instructions and explore them a bit. We're going to use them as a guide to get the auto-tagging functionality working in our controller.

We've copied over the relevant part of the docs for you below.  _(We do not need to include the `require 'algorithmia'` statement from the docs.)_ Just like with the Bootstrap docs, our challenge will be to copy over the example and then figure out how to bend and modify it to serve our purposes.

The variable and method names are new to us, but the structure of the code should be familiar by now — it's still just `variable = object.method`, etc. And you'll still need to replace the hardcoded strings with dynamic input coming in from user-submitted forms.

```
input = "A purely peer-to-peer version of electronic cash would allow online payments to be sent directly from one party to another without going through a financial institution. Digital signatures provide part of the solution, but the main benefits are lost if a trusted third party is still required to prevent double-spending. We propose a solution to the double-spending problem using a peer-to-peer..."
client = Algorithmia.client('your_api_key')
algo = client.algo('nlp/AutoTag/1.0.1')
result = algo.pipe(input).result
```

Let's walk through Algorithmia's sample code:

`input` holds the text to be tagged.
`client` holds the Algorithmia object that will process your data. This object needs to be initialized with your unique API key.
`algo` represents the specific Algorithmia algorithm to be run. In this case, it's using the 'nlp/AutoTag/1.0.1' algorithm.
`result` is the final output of the alorithm. There are multiple methods chained together here, but at a high level the output was calculated by sending the `input` to the `algo` variable to actually run the algorithm with your data.

We can change the _variable_ names given in the example if we want to, but the _method_ names are provided by the author of the `Algorithmia` class that we're borrowing, so we need to use those as is.

You'll need to make some adjustments to the sample code to get it working in your project. For example, you can assume that `@text` works like `input` and holds all the data to be tagged. This means you can skip the first line of `input = "A purely..."` and use the `@text` variable in place of `input`. In addition, you need to send your results down to the view, so you'll need to replace `result` with `@tags`. These should be the only two changes for the first Algorithmia problem. You'll go through a similar pattern of changes in the other two problems.

If you ever find that you want to delve a little deeper into the variables from your controller, here's a trick: force the error page to pop up, since the error page (after you run the `bin/whitelist` command the first time) has the very helpful rails console in the middle of the page where you can play around with your variables and see what's inside them. So, you could for example, just throw in an undefined variable:

```
class TextTagController < ApplicationController
  def text_tag
    @text = params[:text]

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    some_intermediate_variabe = "hello world"

    @tags = "Replace this string with your answer"

    asdasdasdasdasdads # <= this is not defined!

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("text_tag/text_tag.html.erb")
  end
end

```

Then, the next time you visit the page, you should see the helpful error page with the interactive rails console that will give you access to all the defined variables at that moment, in this case `text_tag` action. You can poke around interactively at `some_intermediate_variabe` and `@tags` in order to debug and plan your next steps.

### Problem 2 - Colorize Images

The next service we'll use colorizes black and white images.

Here's how it should work:

- If I visit `/colorize`, I should see a form that has a single input which lets me enter the URL of a black and white image.
    - We aren't going to implement file uploads right now (that will come in Week 8), so the image should already be hosted somewhere on the internet.
    - You can use

        ```
        http://omnicalc-actions.herokuapp.com/migrant-mother-original.jpg)
        ```

        if you want to, or find a different one. If you find a different one, make sure it's a real URL of an image, starting with `http` — confirm by pasting it into a new browser tab and you should see nothing but the image itself (no surrounding HTML). Google Images, in particular, recently made it harder to get the raw image's URL (probably due to copyright concerns).

    - If you want to use one of your own photos (a family photo, for example), you can [use Dropbox to host and get a public URL for it](https://cantonbecker.com/etcetera/2014/how-to-directly-link-or-embed-dropbox-images/).
    - Smaller images are better, at least while you are testing your code, because colorizing a black and white image is hard (almost magic)! It takes a long time. Once you get everything working, you can replace with a larger version.
- The input should have a label of `Image URL` and the button you click to submit the form should be called `Colorize`.
- When the form is submitted, I should see a colorized version of the original black and white picture.

**Note:** Due to the 30 seconds or so it takes to colorize a photo, we've hardcoded the output in the target — it doesn't actually change based on the input URL. You'll have to make your own app work if you want to colorize your own image!

As usual, we would get started by exploring the docs for [Image Colorization](https://algorithmia.com/algorithms/deeplearning/ColorfulImageColorization). Here is the key part of the Ruby section:

```
input = {
  image: "data://deeplearning/example_data/lincoln.jpg"
}
client = Algorithmia.client('your_api_key')
algo = client.algo('deeplearning/ColorfulImageColorization/1.1.13')
result = algo.pipe(input).result
```

We will have to substitute our own image's URL and API key. But then, the variable `result` would then contain a hash that looks like:

```
{
  "output" => "data://.algo/deeplearning/ColorfulImageColorization/temp/lincoln.jpg"
}
```

We'll have to do a little extra work to pull out the colorized image, since we can't use that hash directly as the `src` of an `<img>` element, of course. We need to pull out the value of the ``"output"`` key.

We're still not done, though. If you paste the value into a browser, you wont see an actual image. That's because it starts with `data://`, not `https://` like a proper URL. You'll need to figure out how to transform the value into something that looks  like:

```
https://algorithmia.com/v1/data/.algo/deeplearning/ColorfulImageColorization/temp/lincoln.jpg
```

Remember your [String methods from the Introduction to Ruby](https://guides.firstdraft.com/introduction-to-ruby/fundamental-classes#string)!

### Problem 3 - Auto-tag Images

The next service we'll use tags images.

Here's how it should work:

- If I visit `/image-tag`, I should see a form that has a single input which lets me enter the URL of an image. You can use [http://www.pjproductions.co.uk/blog_images/Chicago-Booth-Group-photo-Pete-Jones.jpg](http://www.pjproductions.co.uk/blog_images/Chicago-Booth-Group-photo-Pete-Jones.jpg) as an example. Try to make sure you use images with people in it, since the tags are not as descriptive for pictures with inanimate objects or animals.
- The input should have a label of `Image URL` and the button you click to submit the form should be called `Colorize`.
- When the form is submitted, I should see a set of tags inside an unordered list.

The API needs a bit of time to do it's work, so expect it to take about 30 seconds or so for the request to complete.

As usual, we would start by exploring the docs for [Illustration Tagger](https://algorithmia.com/algorithms/deeplearning/IllustrationTagger). We've copied over a version of the instructions for you below. You'll still need to replace the hardcoded input with dynamic input coming in from user-submitted forms.

```
input = {
  image: "data://deeplearning/example_data/trudeau.jpg"
}
client = Algorithmia.client('your_api_key')
algo = client.algo('deeplearning/IllustrationTagger/0.4.0')
result = algo.pipe(input).result
```

As per the example in the docs, the result will be an object that looks something like this:

```ruby
{
  "character" => [],
  "copyright" => [
    { "real life" => 0.3819650411605835 },
  ],
  "general" =>
  [
    { "1boy" => 0.9390615820884703 },
    { "solo" => 0.9158311486244202 },
    { "male" => 0.6592671275138855 },
    { "black hair" => 0.4281844198703766 },
    { "necktie" => 0.2363460510969162 },
    { "formal" => 0.2307535260915756 },
  ],
  "rating" =>
  [
    { "safe" => 0.9924461245536804 },
    { "questionable" => 0.006749283988028765 },
    { "explicit" => 0.0001874927111202851 },
  ],
}
```

Your goal is to put the array of tags,

```ruby
[
  { "1boy" => 0.9390615820884703 },
  { "solo" => 0.9158311486244202 },
  { "male" => 0.6592671275138855 },
  { "black hair" => 0.4281844198703766 },
  { "necktie" => 0.2363460510969162 },
  { "formal" => 0.2307535260915756 },
]
```

into the `@tag_hashes` variable.
