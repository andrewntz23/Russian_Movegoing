<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    
    
    
    <pattern>
        <let name="persons" value="doc('exampleIndex.xml')//person/@xml:id"/>
        <rule context="person/@ref">
            <assert test=". = $persons">All person references must correspond to a person in the index.</assert>
        </rule>
    </pattern>
    
    <pattern>
        <let name="films" value="doc('exampleIndex.xml')//film/@xml:id"/>
        <rule context="film/@ref">
            <assert test=". = $films">All film references must correspond to a film in the index.</assert>
        </rule>
    </pattern>
    
    
    
    
</sch:schema>