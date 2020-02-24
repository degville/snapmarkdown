Our documentation is a community effort, [published](https://docs.snapcraft.io) via the [DIscourse](https://www.discourse.org/) forum hosted at [forum.snapcraft.io](https://forum.snapcraft.io). We warmly welcome community contributions, suggestions, fixes and constructive feedback.

Our [Documentation roadmap](/t/the-docs-roadmap/8763) outlines both our short-term and long-term goals for Snap-related documentation.

Feel free to modify any [documentation topic](https://forum.snapcraft.io/c/doc) with updated or more insightful information. If you already  participate in the snap community, you don't need additional permissions; pages are freely editable within the forum itself. Of course, feel free to ask and discuss when appropriate.

Documentation consistency is vital, which is why we're listing some guidelines below, but don't let this formality put you off  - just start writing and editing. If something is inconsistent, we'll fix it.

As [Voltaire](https://en.wikipedia.org/wiki/Voltaire) wrote, "_Perfect is the enemy of good_," and we'd rather have inconsistent documentation we can easily fix than non-existent documentation we can't.

## Style and language

One of our biggest challenges is accommodating an audience with a huge variation in experience, from beginners exploring the *snap* command, through snap creators experimenting with _snapcraft.yaml_, to experts harnessing the API and deploying snaps across thousands of IoT devices.

Consequently, we try to:
- pitch the writing and editing appropriately for the subject
- write inclusively and assume very little prior knowledge of the reader 
- link or explain phrases, acronyms and concepts that may be unfamiliar, and if unsure, err on the side of caution

Some general tips:
- use a spell checker
- resist being overly formal
- resist being overly verbose
- verify links and examples

We (mostly) adhere to the [Ubuntu style guide](https://docs.ubuntu.com/styleguide/en). In particular:
- we use British English (en-GB), for example:
  -   the _ise_ suffix in preference to _ize_ (_capitalise_ rather than _capitalize_)
  - _our_ instead of _or_ (as in _colour_ and _color_)
  - license as a verb, licence as a noun
  - catalogue rather than catalog
- dates take the format _1 January 2013_, _1-2 January 2013_ and _1 January - 2 February 2013_

## Discourse Markdown

Documentation is written in the [Markdown](https://daringfireball.net/projects/markdown/syntax) format [supported by Discourse](https://meta.discourse.org/t/post-format-reference-documentation/19197/2).

Mostly, you don't need to worry about the syntax. You can simply use the style toolbar in the Discourse topic editing window to mark the elements you need.

### Headings and titles

```markdown
## Subheading within a document
### Subheading of a subheading
```
We don't use the top-level heading (`# Heading`) because the topic title in Discourse serves this purpose.

![Screenshot_20190228_145538|571x134](upload://jtlPXCTTY0N5oVySlvyyU0H4O92.png)

Headings and subheadings need to use _sentence case_, which means the first letter is typically the only one capitalised, unless the title includes names, product names or acronyms.

### Lists

For a bullet list, use the following syntax:

```markdown
We (mostly) adhere to the Ubuntu style guide, for example:
- we use British English (en-GB):
  - the _ise_ suffix in preference to _ize_ 
```
And for a numbered list, precede each item with `1.` (the numbering then becomes automatic, and it's easier to insert new items):

```markdown
1. This is the first item
1. This is the second
1. This is the third
   1. This is a sublist 
```

Unless a list item is particularly long (which should be avoided) and includes punctuation, don't end the item with a full stop. If one item needs a full stop, add the full stop to other items too.

### Code blocks

Enclose a code block with three backticks and include the *type* of code:

    ```yaml
    name: gimp
    version: '2.10.8'
    summary: GNU Image Manipulation Program
    ```

The most common code types are: `bash`, `yaml`, `json`, and `no-highlight`. The last is like a miscellaneous type. It is often used to display command output.

Also, a little contentiously as it goes against the [style guide](https://docs.ubuntu.com/styleguide/en), we use a command line dollar prompt (`$`) to demarcate input and output in the same code block:

```bash
$ snap version
snap    2.36.1
snapd   2.36.1
series  16
ubuntu  18.04
kernel  4.15.0-39-generic
```

### Inline code

Use a backtick mark inline commands and other literals. For instance, to create `$SNAP_DATA`:

```markdown
For instance, to create `$SNAP_DATA`:
```

### Hyperlinks

For links to internal files or external URLs, use the following format:

```markdown
[visible text](url)
```

The `visible text` is what will appear in the documentation. The `url` is either the full URL of a link outside of the documentation, or the topic reference without the domain name for a page within the documentation. 

To link to `https://forum.snapcraft.iosnapcraft-overview.md`, for example, you would use the following:

```markdown
For more details, see [Snapcraft overview](snapcraft-overview.md).
```
The Discourse topic identifier, _8940_ in the above example, is optional and can be omitted.

### Anchors

Discourse Markdown does not support anchor links to a position *within* the same page or another document.

However, you can use standard HTML within Markdown, which means we can manually add HTML anchor elements that can be linked to.

The [recommended way](https://meta.discourse.org/t/deep-linking-to-headings-anchors/47552) to create anchors is using heading elements with an ID. The ID needs to have `heading--` as a prefix:

```html
<h3 id='heading--myanchor'>Link to me</h3>
```

To create an anchor called `base-snap`, for example, enter the following into your document:

```html
<h3 id='heading--base-snap'>Base snaps</h3>
```

This can now be linked to with the following:

```markdown
/t/snapcraft-overview#base-snap
```

Use HTML sparingly as it can make the raw text difficult to read.

### Notes and admonishments

It's occasionally worth highlighting important notes or warnings outside of the main body of text. These are called admonishments.

There is no current standard for admonishments with Discourse Markdown. We have hijacked Markdown's  block-quote syntax for this purpose, starting an admonishment with a `>`, often followed by a symbol, and then the text itself:

For example:
> ⓘ **Note**: Layouts can only help _within_ a snap's environment.

The Markdown for the above is as follows:

```markdown
> ⓘ **Note**: Layouts can only help _within_ a snap's environment.
```
An _admonishment type_ is typically either 'Note' or 'Warning' or omitted completely.

### Comments

Sometimes it's useful to provide information to documentation editors. For that, add the comment inside a block quote that includes the :construction: icon. These will be excluded from the dedicated documentation web site, but will be visible in the forum when editing. It may look similar to this:

```markdown

```
### Foldouts

When a page contains a lot of extraneous information such as walkthroughs or reference tables, a *foldout* can be used. This will create a collapsed header which, when clicked, will expand to display all the content below it.

Foldout syntax in Discourse uses two sets of square brackets with an open and close details tag that acts as the title in the opening brackets:

```markdown
[details=Manually create a network on a 10.x.x.x subnet]

If you try to run `lxd init` on a system that is connected to a network with a `10.x.x.x` subnet,
then the final step of the Iinit* may fail with the following error:

[/details]
```
The above will appear as follows:

[details=Manually create a network on a 10.x.x.x subnet]

If you try to run `lxd init` on a system that is connected to a network with a
`10.x.x.x` subnet, then the final step of the Iinit* may fail with the following error:

[/details]

### Images

Most of our documentation covers command line tools, editing and developing. However, if relevant, we highly encourage the use of images. An image should be easier to understand than text, reinforce concepts being discussed in the topic, and break the monotony of words following words.

When making images:
- do not crop your images too closely to allow context
- use a resolution high enough to make text legible and work with high-DPI displays
- a wide aspect ratio fits better with the width of the rendered documentation
- save with lossless compression, such as PNG for screenshots (JPG is acceptable for photos)

Images can be simply dragged and dropped into the topic you're editing, or uploaded via the toolbar icon. It can also be helpful to edit the description field of an image link after uploading:

```markdown
![description of image](url)
```<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/documentation-guidelines/3798'>the forum topic</a>.