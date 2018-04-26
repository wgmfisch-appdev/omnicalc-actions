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
 1. Now paste the URL of your running application into a Chrome tab (or click the underlined URL that appears in the terminal when you run the project). If all went well, you should see the New Word Count form. **If not, let us know right away.**
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
 1. Keep working; your goal is to make your application behave exactly like the target. Next, work on the [Loan Payment calculator](http://localhost:3000/loan_payment/new). You'll again be working in the same file, `/app/controllers/calculations_controller.rb`. This time, scroll down to the method `def loan_payment` and write your code in there as indicated by the comments.
 1. Some tasks are easier, some are much harder. For example, in the Descriptive Statistics calculator, finding the mode (the number that occurs most frequently in a list of numbers) is surprisingly hard. Do your best, but don't get discouraged if you can't quite solve it.
 1. The [Introduction to Ruby](https://guides.firstdraft.com/introduction-to-ruby.html) contains enough tools to solve all of the Omnicalc challenges. (You can build up almost anything from scratch given conditionals, loops, and variables.) You should attempt to solve it using the tools you've already seen.
 1. For the mode calculation, just worry about the simplest case; when there's one number that occurs most frequently, that should be shown as the mode. I won't be testing the case that there's a tie.
 1. When you're ready for some automated feedback, run `rspec` in a Terminal tab. There will be a bunch of output; don't be intimidated! Try to read through it and make sense of it; ask questions on Piazza, and we'll discuss in detail next week.
 1. Ask lots of questions!

 > Make sure to use the following formula for your loan payment calculation:

 ![Payment formula](payment_formula.gif?raw=true "Payment formula")

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

We'll also need to make sure your API key stays hidden, in case your project ever gets pushed to Github or another public repository. Unsavory types like to scrape Github for sensitive information like API keys and run up huge bills for compromised users. In this specific case, you didn't have to tie your API key to a credit card, but protecting your API keys is generally good practice.

We can do this fairly easily in your workspace:

> If you realize you've made an error on any of the following steps, just type in `cd ~/workspace` and hit enter. That should get you back to the starting point.

1. Type in `cd ~` and hit enter. This command should take you to the home folder of your workspace
1. Type in `touch .bash_profile` and hit enter. This command creates a hidden file called `.bash_profile`
1. Type in `ls -a` and hit enter. You'll see a list of all the files in your current directory, including hidden files that start with a `.`
1. Mouse over the file called `.bash_profile` and click it. The file should open up in your GeocodingController
1. Paste in the following code into the file but make sure to use your own Algorithmia key on the right side of the `=` sign


        ALGORITHMIA_KEY="replace_me_with_your_key"

1. In terminal type in `cd ~/workspace` to go back to your initial workspace.
      > If you ever need to reopen your bash profile, type `cd ~`, hit enter, then type `ls -a`, hit enter and click on the file to open it.

1. The code we put into the `.bash_profile` is just a key-value pair that we can access anywhere in our Rails environment using the ENV hash. For example, to access this 'sensitive' info, we can open up Rails console and type in:

        ENV['ALGORITHMIA_KEY']

    and we should see output of

        "replace_me_with_your_key"

You can use this pattern throughout your Rails app to pull up any sensitive info. Practice by using the `.env` file to store your actual Algorithmia API key.

### Problem 1 - Auto-tag Text

The first service we'll use auto-tags blocks of text.

Here's how it should work:

- If I visit `/text-tag`, I should see a form that has a single textarea element which lets me enter text for tagging. If you'd like an example, you can use this excerpt from the Paul Graham essay, [Do Things That Don't Scale](http://www.paulgraham.com/ds.html):

```
One of the most common types of advice we give at Y Combinator is to do things that don't scale. A lot of would-be founders believe that startups either take off or don't. You build something, make it available, and if you've made a better mousetrap, people beat a path to your door as promised. Or they don't, in which case the market must not exist.
```
- The textarea should have a label of `Text` and the button you click to submit the form should be called `Generate Tags`.
- When the form is submitted, I should see an unordered list of tags corresponding to the submitted text. If you used the example text, you should see the following tags:
```
beat
case
door
exist
market
path
people
promise
```

Visit the [AutoTag page](https://algorithmia.com/algorithms/nlp/AutoTag), and use the instructions at the bottom of the page as a starting point to integrate the API in your controller. ** You do not need to include the `require 'algorithmia'` statement from the instructions**. We've copied over a version of the instructions for you in the code below. This is code that Algorithima provides us to get their services working. The variable and method names are new to us, but the structure of the code should be familiar by now. You'll still need to replace the hardcoded input with dynamic input coming in from user-submitted forms.

```
input = "A purely peer-to-peer version of electronic cash would allow online payments to be sent directly from one party to another without going through a financial institution. Digital signatures provide part of the solution, but the main benefits are lost if a trusted third party is still required to prevent double-spending. We propose a solution to the double-spending problem using a peer-to-peer..."
client = Algorithmia.client('your_api_key')
algo = client.algo('nlp/AutoTag/1.0.1')
result = algo.pipe(input).result
```

If you ever find that you want to delve a little deeper into the variables from your controller, you can print those values to the terminal using the `ap()` method. For example:

```
class TextTagController < ApplicationController
  def text_tag
    @text = params[:text]

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    some_intermediate_variabe = "hello world"
    ap(some_intermediate_variabe)

    @tags = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("text_tag/text_tag.html.erb")
  end
end

```

Then, you should see "hello world" get printed to the terminal tab where you started your server. There's some noise to sift through, but you should still be able to see the output at the bottom of your server log.

### Problem 2 - Colorize Images

The next service we'll use colorizes black and white images.

Here's how it should work:

- If I visit `/colorize`, I should see a form that has a single input which lets me enter the URL of a black and white image. You can use [https://cdn.vox-cdn.com/uploads/chorus_asset/file/4863353/grantpark-1.0.jpg](https://cdn.vox-cdn.com/uploads/chorus_asset/file/4863353/grantpark-1.0.jpg) as an example. The smaller the image, the better. Try not to go beyond 800x800px.
- The input should have a label of `Image URL` and the button you click to submit the form should be called `Colorize`.
- When the form is submitted, I should see a colorized version of the original black and white picture

The API needs a bit of time to do it's work, so expect it to take about 30 seconds or so for the request to complete.

Visit the [Image Colorization page](https://algorithmia.com/algorithms/deeplearning/ColorfulImageColorization), and use the instructions at the bottom of the page as a starting point to integrate the API in your controller.

We've copied over a version of the instructions for you in the code below. You'll still need to replace the hardcoded input with dynamic input coming in from user-submitted forms.

```
input = {
  image: "data://deeplearning/example_data/lincoln.jpg"
}
client = Algorithmia.client('your_api_key')
algo = client.algo('deeplearning/ColorfulImageColorization/1.1.13')
result = algo.pipe(input).result
```

Expect to do a little extra work to pull out the colorized image. The result you recieve from `algo.pipe(input).result` is actually a hash that looks like:

```
{
  "output": "data://.algo/deeplearning/ColorfulImageColorization/temp/grantpark-1.0.png"
}
```

But you can't use that hash directly inside an image tag. You'll need to extract the value of the ``"output"`` key. There's still one more step, though. If you paste this example value into a browser, you wont see an actual image. That's because the `data://` formate is internal to Algorithmia's system. You'll need to figure out how to transform the value into something that looks more like:

```
https://algorithmia.com/v1/data/.algo/deeplearning/ColorfulImageColorization/temp/grantpark-1.0.png
```

### Problem 3 - Auto-tag Images

The next service we'll use tags images.

Here's how it should work:

- If I visit `/image-tag`, I should see a form that has a single input which lets me enter the URL of an image. You can use [http://www.pjproductions.co.uk/blog_images/Chicago-Booth-Group-photo-Pete-Jones.jpg](http://www.pjproductions.co.uk/blog_images/Chicago-Booth-Group-photo-Pete-Jones.jpg) as an example. Try to make sure you use images with people in it, since the tags are not as descriptive for pictures with inanimate objects or animals.
- The input should have a label of `Image URL` and the button you click to submit the form should be called `Colorize`.
- When the form is submitted, I should see a set of tags inside an unordered list.

The API needs a bit of time to do it's work, so expect it to take about 30 seconds or so for the request to complete.

Visit the [Illustration Tagger page](https://algorithmia.com/algorithms/deeplearning/IllustrationTagger), and use the instructions at the bottom of the page as a starting point to integrate the API in your controller.

We've copied over a version of the instructions for you in the code below. You'll still need to replace the hardcoded input with dynamic input coming in from user-submitted forms.

```
input = {
  image: "data://deeplearning/example_data/trudeau.jpg"
}
client = Algorithmia.client('your_api_key')
algo = client.algo('deeplearning/IllustrationTagger/0.4.0')
result = algo.pipe(input).result
```

Be careful with sending `result` down directly without any further processing. Is it actually an array of tag hashes? Use `ap()` or check the [Illustration Tagger page](https://algorithmia.com/algorithms/deeplearning/IllustrationTagger) to make sure the output is what you expect. If it's not, what processing can you do to get a list of tag hashes?
