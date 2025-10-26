# Vantage Typst

An ATS friendly simple Typst CV template, inspired by [alta-typst by George Honeywood](https://github.com/GeorgeHoneywood/alta-typst).
See [`example.pdf`](/example.pdf) for the rendered PDF output.

![Preview](/resources/example.jpg)

## Features
- **Two-column layout**: Skills and Certifications on the left, Job Experience and Education on the right, organized for easy scanning.
- **Customizable icons**: Add or replace icons to suit your personal style.
- **Responsive design**: Adjusts well for various print formats.

## Usage

### Running Locally with Typst CLI
1. **Install Typst CLI**: Follow the installation instructions on the [Typst CLI GitHub page](https://github.com/typst/typst#installation) to set up Typst on your machine.
2. **Clone the repository**:
   ```bash
   git clone https://github.com/mshcherbyna99/vantage-typst.git
   cd vantage-typst
   ```
3. **Run Typst**: Use the following command to render your PDF CV in the same directory:
   ```bash
   typst compile example.typ
   ```
4. **Edit your CV layout**: Open the `example.typ` file in your preferred text editor to customize the layout.

### Configuration
You can easily customize your personal data by editing the `configuration.yaml` file.
This file allows you to set your name, contact information, work experience, education, certificates and skills.

Here’s how to do it:
1. Open the `configuration.yaml` file in your text editor.
2. Update the fields with your personal information.
3. Save the file, and your CV will automatically reflect these changes when you compile it.

## Icons
You can enhance your CV with additional icons by following these steps:
1. **Upload Icons**: Place your `.svg` files in the `/resources/icons` folder.
2. **Reference Icons**: Modify the `name` of the `contacts` array in the YAML file, to include your new icons.

## License
This project is licensed under the [MIT License](./LICENSE).

## Acknowledgments
- Inspired by the work of [George Honeywood](https://github.com/GeorgeHoneywood/alta-typst).

For any questions or contributions, feel free to open an issue or submit a pull request!
