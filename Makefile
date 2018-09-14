help:
	@echo "pack  package the app"

pack:
	# remove the old app
	rm -f TCS_-_Unstructured_Indicator_Importer.zip
	# copy the app into a new directory
	cp -r ./Unstructured_Indicator_Importer TCS_-_Unstructured_Indicator_Importer
	# zip the app (do it recursively (-r) and ignore any hidden mac files like '_MACOSX' and '.DS_STORE' (-X))
	zip -r -X TCS_-_Unstructured_Indicator_Importer.zip TCS_-_Unstructured_Indicator_Importer
	# remove the copy of this package
	rm -rf TCS_-_Unstructured_Indicator_Importer
	@echo "App has been packaged here: TCS_-_Unstructured_Indicator_Importer.zip"
