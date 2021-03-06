/*
	 * generated by Xtext 2.17.1
	 */
	package org.xtext.example.mydsl.generator
	
	import org.eclipse.emf.ecore.resource.Resource
	import org.eclipse.xtext.generator.AbstractGenerator
	import org.eclipse.xtext.generator.IFileSystemAccess2
	import org.eclipse.xtext.generator.IGeneratorContext
	import org.xtext.example.mydsl.anislide.impl.ModelImpl
	import org.xtext.example.mydsl.anislide.Model
	import org.xtext.example.mydsl.anislide.TemplateEntity
	import org.xtext.example.mydsl.generator.LatexGenerator
	import java.util.List
	import java.util.Map
	
	/**
	 * Generates code from your model files on save.
	 *
	 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
	 */
	class AnislideGenerator extends AbstractGenerator {
		protected Model model
		protected Map<String, List<TemplateEntity>> templateEntities
		protected Resource resource
		protected IFileSystemAccess2 fsa
		protected IGeneratorContext context
		protected String title
	
		override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
			initialise(resource, fsa, context)
			var LatexGenerator generator = new LatexGenerator(resource, fsa, context);
			generator.generateDocument();
			
		}
		def initialise(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
			this.resource = resource
			this.fsa = fsa
			this.context = context
			model = resource.allContents.filter(ModelImpl).next;
			iterate()
			title = resource.URI.lastSegment()
			title = title.substring(0, title.length-4)
		}
	
		def iterate() {
			if (model.templates.length != 0) {
				for(template : model.templates){
					println("elel");
				}
				
			}
			if (model.slides.length != 0) {
				println(model.slides)
			}
			if (model.global.length == 1) {
				println(model.global)
			}
			if (model.progressanimations.length != 0) {
				println(model.progressanimations)
			}
			
		}
	}
	