# Indicator Importer

App for quickly and easily getting indicators into the platform and adding metadata around them.

![Indicator importer: quick and easy](demo.gif)

## Installation

To install this app in ThreatConnect, use the following commands:

```
# clone this repo
git clone https://gitlab.com/fhightower-tc/unstructured-indicator-importer.git
cd unstructured-indicator-importer
# package the app
make pack
```

After running these commands, there will be a zip file named `TCS_-_Unstructured_Indicator_Importer.zip` in the top directory of the app which you can install in ThreatConnect.

## Setup

### Attributes in Datastore (required)

The unstructured indicator importer spaces app pulls attributes from the datastore. Thus, you will need to write a list of attributes like the one in [example_datastore_attributes.json](https://gitlab.com/fhightower-tc/unstructured-indicator-importer/blob/master/example_datastore_attributes.json) to the datastore. This attributes json needs to be added in the following datastore:

```
/organization/app-data/attributes

{"text": "[...<ATTRIBUTES HERE>...]"}
```

There is a playbook to do this [here](https://github.com/ThreatConnect-Inc/threatconnect-playbooks/tree/master/playbooks/TCPB-HT-Unstructured%20Indicator%20Importer%20Attribute%20Recorder).

### PDF Reader Playbook (optional)

To be able to import content from a PDF online, you will need to install a playbook with an HTTP link trigger app that makes a request to the given site, reads the contents as a PDF, and returns the text. This playbook is available [here](https://github.com/ThreatConnect-Inc/threatconnect-playbooks/tree/master/playbooks/TCPB-HT-PDF%20Reader). Once you have installed the playbook, you also need to add the link to the playbook's HTTP link trigger into this app's configuration in the field labeled "Link to PDF Reader Playbook".

### URL Reader Playbook (optional)

To be able to import content from a URL, you will need to install a playbook with the [HTML Text Parser](https://github.com/ThreatConnect-Inc/threatconnect-playbooks/tree/master/apps/TCPB_-_HTML_Text_Parser) playbook app. This playbook is available [here](https://github.com/ThreatConnect-Inc/threatconnect-playbooks/tree/master/playbooks/TCPB-HT-URL%20Reader). Once you have installed the playbook, you also need to add the link to the playbook's HTTP link trigger into this app's configuration in the field labeled "Link to URL Reader Playbook".

### OCR Reader Playbook (optional)

To be able to import content from an image online using [OCR](https://en.wikipedia.org/wiki/Optical_character_recognition), you will need to install a playbook with an HTTP link trigger app that makes a request to the given site, runs OCR on the image, and returns the text. Once you have installed such a playbook, you also need to add the link to the playbook's HTTP link trigger into this app's configuration in the field labeled "Link to OCR Playbook".

## Advanced Usage

### Custom Metrics

Every time this app is run, it posts content to a [custom metric](https://docs.threatconnect.com/en/latest/rest_api/custom_metrics/custom_metrics.html#custom-metrics) endpoint. If you're interested in learning more about this, raise an issue and I can explain it further.

### Indicator Profiles

This app provides a functionality I'm calling "Indicator Profiles". It allows you to form a template made up of attributes and tags that can be applied to indicators in bulk. For example, I may want to have a profile for callback URLs that applies the "C2" tag and an "IP and Host Usage" attribute with a value of "C2". If you have questions, raise and issue and I can add more documentation about how to make these.

## Credits

This package was created with [Cookiecutter](https://github.com/audreyr/cookiecutter) and [Floyd Hightower's Spaces App Template](https://gitlab.com/fhightower-templates/threatconnect-js-spaces-template).
