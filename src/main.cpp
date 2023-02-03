#include <iostream>
#include <GL/glew.h>
#include <GLFW/glfw3.h>

#include "main.hpp"

int	main(void)
{
	if (!glfwInit())
		return (1);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);
	glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
	GLFWwindow* window = glfwCreateWindow(640, 480, "3D Game of Life", NULL, NULL);
	if (!window)
		return (2);
	glfwMakeContextCurrent(window);
	std::cout << glGetString(GL_VERSION); fflush(stdout);
	glClearColor(1.0f, 0.0f, 0.0f, 1.0f);
	while (!glfwWindowShouldClose(window))
	{
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        glfwSwapBuffers(window);
        glfwPollEvents();
	}
	glfwDestroyWindow(window);
	glfwTerminate();
	return (0);
}
