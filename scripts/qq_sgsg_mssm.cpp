#include <marty.h>
#include "marty/models/pmssm_lem.h"

using namespace mty;

int main() {

    PMSSM_LEM pmssm;

    auto ampl = pmssm.computeAmplitude(
            TreeLevel,
            {Incoming("b"), Incoming(AntiPart("b")), Outgoing("sG"), Outgoing("sG")}
            );
    Display(ampl);
    Show(ampl);

    auto squared = pmssm.computeSquaredAmplitude(ampl);

    Library lib("qq_gg_pmssm");
    lib.addFunction("M2", squared);
    lib.print();

    return 0;
}
