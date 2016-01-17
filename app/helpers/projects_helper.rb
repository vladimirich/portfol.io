module ProjectsHelper
  def project_preview(project)
    return if project.project_previews.empty?
    link_to(
      image_tag(
        project
          .project_previews
          .first
          .try(:image)
          .try { |image| image.url(:medium) },
        class: 'image-preview'
      ),
      edit_project_path(project)
    )
  end
end
