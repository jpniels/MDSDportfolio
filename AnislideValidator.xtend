/*
   * generated by Xtext 2.16.0
 */
package org.xtext.example.mydsl.validation

import org.eclipse.xtext.validation.Check
import org.xtext.example.mydsl.anislide.Style
import org.xtext.example.mydsl.anislide.Textcolor
import java.util.List
import java.util.Arrays
import org.xtext.example.mydsl.anislide.AnislidePackage
import org.xtext.example.mydsl.anislide.BackgroundColor
import org.xtext.example.mydsl.anislide.ProgressBody
import org.xtext.example.mydsl.anislide.SlideBody
import org.xtext.example.mydsl.anislide.Template
import org.xtext.example.mydsl.anislide.Options
import org.xtext.example.mydsl.anislide.Width

/**
 * This class contains custom validation rules. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class AnislideValidator extends AbstractAnislideValidator {
	
//	public static val INVALID_NAME = 'invalidName'
//
//	@Check
//	def checkGreetingStartsWithCapital(Greeting greeting) {
//		if (!Character.isUpperCase(greeting.name.charAt(0))) {
//			warning('Name should start with a capital', 
//					AnislidePackage.Literals.GREETING__NAME,
//					INVALID_NAME)
//		}
//	}
	BackgroundColor bckcolor
	Textcolor txtcolor
	String str = '...'
	List<String> list = Arrays.asList(str.split(","))
	@Check
	def checkNumberInColor(Style style){
		if(style.key == "color:"){
			txtcolor = style as Textcolor
			list =  txtcolor.value.split(",")
			for(color : list)
				if(Float.parseFloat(color) >1)
				warning('Number should be lower than one', AnislidePackage.Literals.TEXTCOLOR__VALUE,'invalid number')
			}
		if(style.key =="background-color:"){
			bckcolor = style as BackgroundColor
			list = bckcolor.value.split(",")
			for(color : list)
				if(Float.parseFloat(color)>1)
				warning('Number should be lower than one', AnislidePackage.Literals.BACKGROUND_COLOR__VALUE,'invalid number')
		}
		return
	}
	 
	
	public static val INVALID_NAME = 'invalidName'
	public static val MISSING_ENTITY = 'missingEntity'
	int count;
	
	@Check
		def checkTemplateNamesStartWithCapital(Template template) {
			if (!Character.isUpperCase(template.name.charAt(0))) {
				warning("Template names should start with a capital letter", AnislidePackage.Literals.TEMPLATE__NAME,
				INVALID_NAME)
		}
	}
	@Check
		def checkOnlyOneProgressType(ProgressBody progressbody) {
			count = 0;
			for (entity : progressbody.progressentities){
				count++;
				if(entity.key == 'type:') {
					if (count > 1) {
					warning("You can only have one type", AnislidePackage.Literals.PROGRESS_BODY__PROGRESSENTITIES, INVALID_NAME)
					}
				}
			}
		}
	@Check
		def checkTitleExists(SlideBody slidebody) {
			for (entity : slidebody.slideentities) {
				if (entity.toString.contains('title:')) {
					return;
				 }
			 	else {
					warning("You need to provide a title", AnislidePackage.Literals.SLIDE_BODY__SLIDEENTITIES, MISSING_ENTITY)	
				}
			}
		}
}
	
	

