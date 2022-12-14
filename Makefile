# Alternative GNU Make workspace makefile autogenerated by Premake

ifndef config
  config=release_x64
endif

ifndef verbose
  SILENT = @
endif

ifeq ($(config),release_x64)
  x_glad_config = release_x64
  x_glfw_config = release_x64
  x_glm_config = release_x64
  x_tinyobj_config = release_x64
  x_imgui_config = release_x64
  sdf_config = release_x64

else ifeq ($(config),debug_x64)
  x_glad_config = debug_x64
  x_glfw_config = debug_x64
  x_glm_config = debug_x64
  x_tinyobj_config = debug_x64
  x_imgui_config = debug_x64
  sdf_config = debug_x64

else
  $(error "invalid configuration $(config)")
endif

PROJECTS := x-glad x-glfw x-glm x-tinyobj x-imgui sdf

.PHONY: all clean help $(PROJECTS) 

all: $(PROJECTS)

x-glad:
ifneq (,$(x_glad_config))
	@echo "==== Building x-glad ($(x_glad_config)) ===="
	@${MAKE} --no-print-directory -C extern -f x-glad.make config=$(x_glad_config)
endif

x-glfw:
ifneq (,$(x_glfw_config))
	@echo "==== Building x-glfw ($(x_glfw_config)) ===="
	@${MAKE} --no-print-directory -C extern -f x-glfw.make config=$(x_glfw_config)
endif

x-glm:
ifneq (,$(x_glm_config))
	@echo "==== Building x-glm ($(x_glm_config)) ===="
	@${MAKE} --no-print-directory -C extern -f x-glm.make config=$(x_glm_config)
endif

x-tinyobj:
ifneq (,$(x_tinyobj_config))
	@echo "==== Building x-tinyobj ($(x_tinyobj_config)) ===="
	@${MAKE} --no-print-directory -C extern -f x-tinyobj.make config=$(x_tinyobj_config)
endif

x-imgui:
ifneq (,$(x_imgui_config))
	@echo "==== Building x-imgui ($(x_imgui_config)) ===="
	@${MAKE} --no-print-directory -C extern -f x-imgui.make config=$(x_imgui_config)
endif

sdf: x-glad x-glfw x-tinyobj x-imgui x-glm
ifneq (,$(sdf_config))
	@echo "==== Building sdf ($(sdf_config)) ===="
	@${MAKE} --no-print-directory -C src -f Makefile config=$(sdf_config)
endif

clean:
	@${MAKE} --no-print-directory -C extern -f x-glad.make clean
	@${MAKE} --no-print-directory -C extern -f x-glfw.make clean
	@${MAKE} --no-print-directory -C extern -f x-glm.make clean
	@${MAKE} --no-print-directory -C extern -f x-tinyobj.make clean
	@${MAKE} --no-print-directory -C extern -f x-imgui.make clean
	@${MAKE} --no-print-directory -C src -f Makefile clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "  release_x64"
	@echo "  debug_x64"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   x-glad"
	@echo "   x-glfw"
	@echo "   x-glm"
	@echo "   x-tinyobj"
	@echo "   x-imgui"
	@echo "   sdf"
	@echo ""
	@echo "For more information, see https://github.com/premake/premake-core/wiki"