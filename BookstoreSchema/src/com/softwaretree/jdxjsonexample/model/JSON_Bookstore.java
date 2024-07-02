package com.softwaretree.jdxjsonexample.model;

import org.json.JSONException;
import org.json.JSONObject;

import com.softwaretree.jdx.JDX_JSONObject;

/**
 * A shell (container) class defining a domain model object class for Book objects 
 * based on the class JSONObject.  This class needs to define just two constructors.
 * Most of the processing is handled by the superclass JDX_JSONObject.
 * <p> 
 * @author ashraf
 *
 */
public class JSON_Bookstore extends JDX_JSONObject {

    public JSON_Bookstore() {
        super();
    }

    public JSON_Bookstore(JSONObject jsonObject) throws JSONException {
        super(jsonObject);
    }
}
