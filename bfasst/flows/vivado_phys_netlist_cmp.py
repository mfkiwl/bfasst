"""Structural Comparison of physical netlist and reversed netlist"""

from bfasst.flows.flow import Flow
from bfasst.flows.vivado_phys_netlist import VivadoPhysNetlist
from bfasst.tools.impl.vivado_impl import VivadoImpl
from bfasst.tools.compare.structural.structural import Structural
from bfasst.tools.rev_bit.xray import Xray
from bfasst.tools.transform.netlist_cleanup import NetlistCleanupTool
from bfasst.tools.transform.phys_netlist import PhysNetlist
from bfasst.paths import FLOWS_PATH
from bfasst.tools.synth.vivado_synth import VivadoSynth


class VivadoPhysNetlistCmp(Flow):
    """Structural Comparison of physical netlist and reversed netlist"""

    def __init__(self, design, synth_options=""):
        super().__init__(design)

        self.synth_options = VivadoPhysNetlist.add_required_synth_options(synth_options)

        self.vivado_synth_tool = VivadoSynth(self, design, synth_options=self.synth_options)
        self.vivado_impl_tool = VivadoImpl(self, design)
        self.phys_netlist_tool = PhysNetlist(self, design)
        self.xray_tool = Xray(self, design)
        self.cleanup_tool = NetlistCleanupTool(self, design)
        self.compare_tool = Structural(self, design)

    def create_build_snippets(self):
        self.vivado_synth_tool.create_build_snippets()
        self.vivado_impl_tool.create_build_snippets()
        self.phys_netlist_tool.create_build_snippets(
            impl_dcp=self.vivado_impl_tool.outputs["impl_checkpoint"],
            impl_edf=self.vivado_impl_tool.outputs["impl_edf"],
        )
        self.xray_tool.create_build_snippets(str(self.vivado_impl_tool.outputs["bitstream"]))
        self.cleanup_tool.create_build_snippets(
            netlist_in_path=self.xray_tool.outputs["xray_netlist"],
        )
        self.compare_tool.create_build_snippets(
            netlist_a=self.cleanup_tool.outputs["netlist_cleaned_path"],
            netlist_b=self.phys_netlist_tool.outputs["viv_impl_physical_v"],
            log_name="struct_cmp.log",
        )

    def get_top_level_flow_path(self):
        return f"{FLOWS_PATH}/vivado_phys_netlist_cmp.py"