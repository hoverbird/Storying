Storying
=============

This is a hack, which can only be defended by pointing out that I am myself a bigger hack than this is (to paraphrase _why).

Storying is a lil' app for generating tons of pretty dubious fiction by combining a bunch of small "story elements" into frameworks that glom them together ("templates"). The goal in this version is to make it stupid simple to throw a bunch of ideas into the system, and then have them recombined and returned to you in unexpected ways.

Up and Running
-------------
1. git clone the URL above
2. We're using Bundler to install Chance and the other dependencies. cd to the project directory and run `bundle update`. You may need to run `gem install bundler` if you don't already have Bundler installed on your system.
3. Start the server with `rake storying`
4. Visit http://localhost:9393 in your browser for a tiny generated story.

What's the point?
-------------
The goal here is quick and easy experimentation.  To this end, there are a few places where you can create entirely new stories and story elements just by tweaking of text here or creating a file there.

- story_elements: These are lists of text snippets that are read by Storying and made available for random access in your stories. They'll be available based on their filename, so Storying.relationships_to_character is a list generated from relationships_to_character.yml.  You can edit these files freely and even add your own new types; just drop a new .yml file in this directory and Storying will pick up on these and make them available to your templates.

- templates: Simple Mustache templates that Storying will pick randomly and render.  Add new templates here with substitutions wrapped in {{braces}} and they'll be thrown in the mix.

- lib/storying: The lib directory is where the stories are constructed.  Here you'll find the Story class itself, which randomly selects its basic components when constructed with `Story.new`.  The story will automatically have a setting, a hero, a supporting_character etc.  Investigate these other types to get an idea of the components so far. Adding to these basic types will be slightly trickier than just dropping in new story elements and templates, but just barely.  Fire up a new *.rb file and the class you define there will be available in your stories. Define your own methods to do work with attributes, or add a has_random_story_element declaration and each new instance of the class will have that attribute, plucked from the story_elements.

