package com.softwaretree.jdxjsonexample.model;

import org.json.JSONException;
import org.json.JSONObject;

import com.softwaretree.jdx.JDX_JSONObject;

/**
 * A shell (container) class defining a domain model object class for Publisher objects 
 * based on the class JSONObject.  This class needs to define just two constructors.
 * Most of the processing is handled by the superclass JDX_JSONObject.
 * <p> 
 * @author ashraf
 *
 */
public class JSON_Publisher extends JDX_JSONObject {

    public JSON_Publisher() {
        super();
    }

    public JSON_Publisher(JSONObject jsonObject) throws JSONException {
        super(jsonObject);
    }
}
