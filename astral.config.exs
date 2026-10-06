import Astral.Config

root(".")
outdir("docs")
base_path("/xmeyers/")

plugin(Astral.Plugin.LLMs, title: "Xmeyers")

layouts do
  default("default.astral")
end
