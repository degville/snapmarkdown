After a snap has been [created](creating-a-snap.md), tested, and [released](releasing-your-app.md) to the [Snap Store](https://snapcraft.io/store), the Store's web interface can be used to perform the following functions:

- [edit metadata](#metadata) to make a snap easily discoverable
- [manage releases](/t/release-management/12442) and channels
- [track installation](/t/snap-store-metrics/12556) and usage statistics

To access the Snap Store, simply go to [https://snapcraft.io/store](https://snapcraft.io/store) and either [Create a developer account](/t/creating-your-developer-account/6760) or login with your developer account credentials.

<h2 id='heading--metadata'>Metadata</h2>

A snap's most important descriptive metadata, initially taken from its [snapcraft.yaml](the-snapcraft-format.md), can be conveniently edited from the Snap Store's web UI. The following fields are vitally important to help users find what they're looking for:
- ensure the **Title** is accurate and uses the correct case and spacing
- write a 79 character **Summary** to pitch the application to people browsing the store.
- Select up to two store **Categories** where your application will be featured.
- Use [Markdown](https://commonmark.org/help/) to format the **Description** to accurately describe the application and highlight it’s most important features. The following syntax is supported:
    - Bold: `**Foo**`
    - URLs: `https://foo.bar`
    - Lists: `* Foo`
    - Italics: `_Foo_`
    - Code: Text indented with 3 spaces or inside `

Use the **Additional information** section to add a license for your project, and also to select whether you want users to see where your snap is being used.

Under **Website and contact links**, include a link to the application website or product page so users can find out more about related products and services. The Contact link is intended to direct users to somewhere they can provide feedback about the application. It should point to a support site, forum or bug tracker.


The Snap Advocacy team love accurate and detailed metadata because they can create effective social campaigns and blog posts to highlight an application. Similarly, it can help to provide a brief functional overview in the *Description* and provide links for further detailed documentation.

## Media

Second only in importance to the quality of a snap's metadata is the addition screenshots and other media to allow prospective users to preview the application.

### Logo and icon

Uploading an icon or a logo will significantly improves the appearance of the application listing in graphical storefronts.

Icon/logo requirements:
- image formats: JPEG & PNG
- max resolution: 480x480
- aspect ratio: 1:1

### Screenshots

Each store entry can feature up to 5 screenshots (or animated GIFs). If the application is cross-platform please upload screenshots taken from a Linux workstation rather than reusing screenshots from other platforms. The images or GIFs need to fit the following requirements:

Screenshot requirements:
- image formats: GIF, JPEG & PNG files
- min resolution: 480 x 480 pixels
- max resolution: 3840 x 2160 pixels
- aspect ratio: Between 1:2 and 2:1
- file size limit: 2MB
- animation min fps: 1
- animation max fps: 30
- animation max length: 40 seconds

> :information_source: PNG-formatted icons, logos and screenshots look better than JPEG.

### Banner and banner icon

![image|690x471](upload://ratdSJxHa8Icx3mgOdId7JxDITH.png)


<br>

The above image shows how a banner and banner icon (top right) are used by the Snap Store.

Each week, the Snap Advocacy team will choose an application as the No.1 featured Snap in the store. Only Snaps with a banner qualify for promotion in the top spot. Uploading a banner does not guarantee the application will be featured, but it helps and the No.1 Editor’s Pick will typically generate a significant volume of new users.

The banner should be uploaded in the same place as other screenshots and must be named banner.png or banner.jpg.

Banner requirements:
- aspect ration: 3:100:
- resolution: between 720 x 240 and 4320 x 1440

Here’s an example banner:

![image|650x127](upload://zCw9Ugeh5aAZjadanbSdNtbN9P2.jpg)

An optional banner icon can be also uploaded in the same place as the screenshots and must be named `banner-icon.png` or `banner-icon.jpg`. If uploaded, the banner icon will be overlayed on the left side of the banner image.<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/using-the-snap-store/12379'>the forum topic</a>.