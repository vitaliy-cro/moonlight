require 'spec_helper'

describe Stuff::SellService do
  subject do
    Stuff::SellService.call(player: player, item: item)
  end

  let(:object) { subject.right }
  let(:errors) { subject.left }

  let(:player) { create(:player, gold: 0) }

  describe 'Equipment::Item' do
    let(:item) { create(:equipment_item) }
    let!(:stuff) { create(:stuff, player: player, stuffable: item) }

    describe 'success' do
      it 'check that service succeeded' do
        expect(subject.success?).to eq true
      end

      it 'check that service has not errors' do
        expect(errors).to be_nil
      end

      it 'checks that stuff is deleted' do
        expect { subject }.to change { player.stuffs.count }.from(1).to(0)
      end

      it 'checks that player has got money deposite' do
        expect { subject }.to change { player.gold }.from(0).to(item.sell_price)
      end
    end

    describe 'failure' do
      it 'checks failure if player has not an item' do
        stuff.delete
        expect(subject.failure?).to eq true
      end
    end
  end

  describe 'Tool::Item' do
    let(:item) { create(:tool_item) }
    let!(:stuff) { create(:stuff, player: player, stuffable: item) }

    describe 'success' do
      it 'check that service succeeded' do
        expect(subject.success?).to eq true
      end

      it 'check that service has not errors' do
        expect(errors).to be_nil
      end

      it 'checks that stuff is deleted' do
        expect { subject }.to change { player.stuffs.count }.from(1).to(0)
      end

      it 'checks that player has got money deposite' do
        expect { subject }.to change { player.gold }.from(0).to(item.sell_price)
      end
    end

    describe 'failure' do
      it 'checks failure if player has not an item' do
        stuff.delete
        expect(subject.failure?).to eq true
      end
    end
  end

  describe 'Resource' do
    let(:item) { create(:resource) }
    let!(:stuff) { create(:stuff, player: player, stuffable: item) }

    describe 'success' do
      it 'check that service succeeded' do
        expect(subject.success?).to eq true
      end

      it 'check that service has not errors' do
        expect(errors).to be_nil
      end

      it 'checks that stuff is deleted' do
        expect { subject }.to change { player.stuffs.count }.from(1).to(0)
      end

      it 'checks that player has got money deposite' do
        expect { subject }.to change { player.gold }.from(0).to(item.sell_price)
      end
    end

    describe 'failure' do
      it 'checks failure if player has not an item' do
        stuff.delete
        expect(subject.failure?).to eq true
      end
    end
  end
end
