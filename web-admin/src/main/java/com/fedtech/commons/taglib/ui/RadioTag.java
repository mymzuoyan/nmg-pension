package com.fedtech.commons.taglib.ui;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import java.io.IOException;

public class RadioTag extends BaseUITag {

	private static final long serialVersionUID = -8107335987481249704L;

	public int doStartTag() throws JspException {
		printCheckBox();
		return SKIP_BODY;
	}

	public void printCheckBox() {
		JspWriter out = pageContext.getOut();
		try {
			out.print("<input type=\"radio\" ");
			printTagAttribute();
			if ((fieldValue != null && value != null && fieldValue.equals(value))
					|| "true".equals(checked) || "checked".equals(checked)) {
				out.print("checked =\"checked\" ");
			}
			out.println(">");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private String checked;

	private String value;
	
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}
}